using UnityEngine;
using System.Collections.Generic;


public class LegController : MonoBehaviour
{
    private Vector3 distance_delta = Vector3.zero; //Distance delta and some helper variables
    private Vector3 last_pos;
    private Vector3 last_rot;

    public Color debug_circle_color = Color.blue; //Debug colors
    public Color debug_line_color = Color.cyan;

    public float max_height_of_step_over = 1f; //How high the leg can move its foot 
    public float max_height_of_step_under = 0.2f; //How low the leg can move its foot 
    public float radius = 0.5f; //Distance allowed before moving a leg while walking
    
    public float precision = 0.1f; //How precise the timer will be. The timer counts using frame time delta so precision will make it more accurate.
    public float walk_cycle_duration = 1f; //How long it will take to move all the legs(in seconds)
    public float step_duration = 0.2f;//How long a step takes
    private bool is_shrinked = false; //When stationary the radius variable shirnks. Checks if its shrinked
    
    public float height_adjust_rate = 0.3f; //How fast/slow the object adjusts its height to match its target
    public float max_degrees_of_rotation_per_frame = 2f; //How many degrees in each axis the object can rotate every frame
    public bool contribute_to_x_rotation = true;
    public bool contribute_to_z_rotation = true;

    private int num_segments = 36; //How many segments the debug circle has(more means more round)

    //private bool[] contributes;
    private Vector3[] target_pos; //The position each target will be glued to
    public List<Transform> targets = new List<Transform>(); //Leg targets
    private GameObject[] target_checkers; //The points in space the targets move to if they must
    private float[] time_elapsed_from_step; //Timers for each leg. Used in the step interpolation
    private Vector3[] start_pos; //Local position of the target_checkers when they are created.
    private int[] left_legs;
    private int[] right_legs;
    private int[] front_legs;
    private int[] back_legs;

    private float height_diff = 0f;

    public bool custom_timings = false; //If custom_timings is true the timng of each leg is stored in the timings List
    public List<float> timings = new List<float>();

    private float timer = 0.0f; //Timer
    private bool in_cycle = false; //Checks if the object is walking

    private RaycastHit ray = new RaycastHit(); //When we use Physics.Raycast, this is where we store the point of contact
    public LayerMask layer = 0; //LayerMask that the ray checks

    public AnimationCurve pace; //Shows the speed of the step

    //public Transform target;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private void Start()
    {
        //Time.timeScale = 0.3f;
        initialise_variables_and_arrays();

        List<int> left_leg_list=new List<int>();
        List<int> right_leg_list=new List<int>();
        List<int> front_leg_list =new List<int>();
        List<int> back_leg_list =new List<int>();
        
        if (!custom_timings)
        {
            for(int i = 0; i < targets.Count; i++)
            {
                setup_target_checkers_and_timings(i);
                timings.Add((walk_cycle_duration / (targets.Count - 1)) * i);

                if ((targets[i].position.x-transform.position.x)<=0f)
                {
                    left_leg_list.Add(i);
                }
                else
                {
                    right_leg_list.Add(i);
                }

                if ((targets[i].position.z-transform.position.z) >= 0f)
                {
                    front_leg_list.Add(i);
                }
                else
                {
                    back_leg_list.Add(i);
                }
            }
        }
        else
        {
            for (int i = 0; i < targets.Count; i++)
            {
                setup_target_checkers_and_timings(i);

                if (targets[i].position.x <= 0f)
                {
                    left_leg_list.Add(i);
                }
                else
                {
                    right_leg_list.Add(i);
                }

                if (targets[i].position.z >= 0f)
                {
                    front_leg_list.Add(i);
                }
                else
                {
                    back_leg_list.Add(i);
                }
            }
        }
        make_arrays(left_leg_list, right_leg_list,front_leg_list,back_leg_list);
        
        height_diff = height_diff / targets.Count;
    }

    // FixedUpdate is called once per physics update
    private void FixedUpdate()
    {
        //transform.LookAt(target);

        distance_delta = transform.position - last_pos;
        Vector3 rotation_delta = transform.rotation.eulerAngles - last_rot;

        if (distance_delta == Vector3.zero && rotation_delta==Vector3.zero)
        {

            for(int i = 0; i < targets.Count; i++)
            {
                target_checkers[i].transform.localPosition = start_pos[i];
            }

            if (!is_shrinked)
            {
                radius /= 5f;
                is_shrinked = true;
            }
            
        }
        else
        {
            in_cycle = true;
            if (is_shrinked)
            {
                is_shrinked = false;
                radius *= 5f;
            }
        }
        

        float curr_diff = 0f;

        for (int i = 0; i < targets.Count; i++)
        {
            if (time_elapsed_from_step[i] > 0f)
            {
                time_elapsed_from_step[i] += Time.fixedDeltaTime;
            }

            Vector3 point = get_ground_point(target_checkers[i].transform.position,i);
            target_checkers[i].transform.position = point;

            float distance = Vector3.Distance(targets[i].position, point);

            if (distance > radius)
            {
                if (check_timing(timer, timings[i]))
                { 
                    initiate_leg_movement(i, distance, point);
                    curr_diff += Vector3.Dot(targets[i].position - transform.position, transform.up);
                }
                else
                {
                    if (in_cycle)
                    {
                        update_leg(i, distance);
                        curr_diff += Vector3.Dot(targets[i].position - transform.position, transform.up);
                    }
                    else
                    {
                        initiate_leg_movement(i, distance, point);
                        curr_diff += Vector3.Dot(targets[i].position - transform.position, transform.up);
                    }
                }
            }
            else
            {
               update_leg(i,distance);
               curr_diff += Vector3.Dot(targets[i].position - transform.position, transform.up);
            }

            if (time_elapsed_from_step[i] >= step_duration)
            {
                time_elapsed_from_step[i] = 0.0f;
            }
        }
        

        curr_diff /= targets.Count;
        adjust_height(curr_diff);

        last_rot = transform.rotation.eulerAngles;
        //transform.rotation = Quaternion.RotateTowards(transform.rotation, calculate_rotation(), max_degrees_of_rotation_per_frame);

        last_pos = transform.position;
        if (in_cycle)
        {
            timer += Time.fixedDeltaTime;
            if (timer > walk_cycle_duration)
            {
                in_cycle = false;
                timer = 0.0f;
            }
        } 
    }
    private void OnDrawGizmos()
    {
        if (target_checkers == null)
        {
            return;
        }
        for (int i = 0; i < target_checkers.Length; i++)
        {
            draw_debug_circle_and_line(target_checkers[i].transform, radius, num_segments, debug_circle_color, debug_line_color);
        }
    }


    private Quaternion calculate_rotation()
    {
        float z_angle = 0f;
        float x_angle = 0f;

        if (contribute_to_z_rotation)
        {
            Vector3 left_avg = get_left_leg_average();
            Vector3 right_avg = get_right_leg_average();

            Vector3 right_left_dir = right_avg - left_avg;

            right_left_dir = Vector3.ProjectOnPlane(right_left_dir, transform.forward);
            z_angle = Vector3.SignedAngle(transform.right, right_left_dir, transform.forward);

            if (Mathf.Abs(z_angle) < 15f)
            {
                z_angle = 0f;// fix_rotation_z(left_avg, right_left_dir);
            }
        }

        if (contribute_to_x_rotation)
        {
            Vector3 front_avg = get_front_leg_average();
            Vector3 back_avg = get_back_leg_average();

            Vector3 front_back_dir = front_avg - back_avg;

            front_back_dir = Vector3.ProjectOnPlane(front_back_dir, transform.right);
            x_angle = Vector3.SignedAngle(transform.forward, front_back_dir, transform.right);
            if (Mathf.Abs(x_angle) < 15f)
            {
                x_angle = 0f;// fix_rotation_x(back_avg, front_back_dir);
            }
        }

        Vector3 rotation_diff = new Vector3(x_angle, 0f, z_angle);
        return Quaternion.Euler(transform.rotation.eulerAngles+rotation_diff);
    }

    private float fix_rotation_z(Vector3 origin, Vector3 direction)
    {
        direction += (transform.position - origin);
        direction = Vector3.ProjectOnPlane(direction, transform.right);
        float angle = Vector3.SignedAngle(transform.right, direction, transform.forward);
        return angle;
    }

    private float fix_rotation_x(Vector3 origin, Vector3 direction)
    {
        direction += (transform.position - origin);
        direction = Vector3.ProjectOnPlane(direction, transform.forward);
        float angle = Vector3.SignedAngle(transform.forward, direction,transform.right);
        return angle;
    }

    private void setup_target_checkers_and_timings(int index)
    {
        time_elapsed_from_step[index] = 0.0f;
        target_pos[index] = targets[index].position;
        target_checkers[index] = new GameObject("Target_checker");
        target_checkers[index].transform.SetParent(transform);
        target_checkers[index].transform.position = targets[index].position;
        start_pos[index] = target_checkers[index].transform.localPosition;
        height_diff += Vector3.Dot(targets[index].position - transform.position, transform.up);
    }

    private void initialise_variables_and_arrays()
    {
        last_rot = transform.rotation.eulerAngles;
        last_pos = transform.position;

        //contributes=new bool[targets.Count];
        time_elapsed_from_step = new float[targets.Count];
        target_pos = new Vector3[targets.Count];
        target_checkers = new GameObject[targets.Count];
        start_pos = new Vector3[targets.Count];
    }

    private void make_arrays(List<int> left,List<int> right,List<int> front,List<int> back)
    {
        left_legs = left.ToArray();
        right_legs = right.ToArray();
        front_legs = front.ToArray();
        back_legs = back.ToArray();
    }

    private Vector3 get_left_leg_average()
    {
        Vector3 pos_sum = Vector3.zero;

        for (int i = 0; i < left_legs.Length; i++)
        {
            if (target_checkers[left_legs[i]].transform.localPosition.x<= 0f)// && contributes[left_legs[i]])
            {
                pos_sum += target_checkers[left_legs[i]].transform.position;
            }
            
        }

        return pos_sum/left_legs.Length;

    }

    private Vector3 get_right_leg_average()
    {
        Vector3 pos_sum = Vector3.zero;

        for (int i = 0; i < right_legs.Length; i++)
        {
            if (target_checkers[right_legs[i]].transform.localPosition.x > 0f)// && contributes[right_legs[i]])
            {
                pos_sum += target_checkers[right_legs[i]].transform.position;
            }
        }

        return pos_sum / right_legs.Length;
    }


    private Vector3 get_front_leg_average()
    {
        Vector3 pos_sum = Vector3.zero;

        for (int i = 0; i < front_legs.Length; i++)
        {
            if (target_checkers[front_legs[i]].transform.localPosition.z >= 0f)// && contributes[front_legs[i]])
            {
                pos_sum += target_checkers[front_legs[i]].transform.position;
            }
        }

        return pos_sum / front_legs.Length;
    }

    private Vector3 get_back_leg_average()
    {
        Vector3 pos_sum = Vector3.zero;

        for (int i = 0; i < back_legs.Length; i++)
        {
            if (target_checkers[back_legs[i]].transform.localPosition.z < 0f )//&& contributes[back_legs[i]])
            {
                pos_sum += target_checkers[back_legs[i]].transform.position;
            }
        }

        return pos_sum / back_legs.Length;
    }

    private void initiate_leg_movement(int index,float distance,Vector3 point)
    {
        target_pos[index] = point;

        float time = Mathf.Clamp01(time_elapsed_from_step[index] / step_duration);
        float step = pace.Evaluate(time) * (distance / step_duration);

        targets[index].position = Vector3.MoveTowards(targets[index].position, target_pos[index], step);
        //contributes[index] = false;

        if (time_elapsed_from_step[index] == 0f)
        {
            time_elapsed_from_step[index] = 0.0001f;
        }
    }

    private void update_leg(int index,float distance)
    {
        target_pos[index] = get_ground_point(target_pos[index],index);

        float time = Mathf.Clamp01(time_elapsed_from_step[index] / step_duration);
        float step = pace.Evaluate(time) * (distance / step_duration);

        targets[index].position = Vector3.MoveTowards(targets[index].position, target_pos[index], step);
        
        targets[index].position = target_pos[index];

        /*if (time_elapsed_from_step[index] == 0f)
        {
            contributes[index] = true;
        }*/
    }

    private void adjust_height(float curr_diff)
    {
        float adjustment = curr_diff-height_diff;
        transform.position = Vector3.Lerp(transform.position,transform.position+(transform.up * (adjustment)),height_adjust_rate);
    }

    private Vector3 get_ground_point(Vector3 position,int index)
    {
        Vector3 ray_start_pos = position;
        Vector3 ray_start_pos_line = position+(max_height_of_step_over) * (transform.up);
        Vector3 direction = (position - ray_start_pos_line).normalized;

        //Debug.DrawRay(ray_start_pos, direction, Color.red);

        Vector3 point;

        if (Physics.Raycast(ray_start_pos_line, direction,out ray, max_height_of_step_over+max_height_of_step_under, layer))
        {
            point = ray.point;
            point.x = position.x;
            point.z = position.z;
        }
        else if(Physics.SphereCast(ray_start_pos + (max_height_of_step_over - radius) * (transform.up), radius, direction, out ray, (max_height_of_step_over + max_height_of_step_under - 2 * radius), layer))
        {
            point = ray.point;
            point.x = position.x;
            point.z = position.z;
        }
        else
        {
            target_checkers[index].transform.position += (-transform.up * 0.01f);
            point = target_checkers[index].transform.position;
        }

            return point;

    }


    public void draw_debug_circle_and_line(Transform center_object,float radius,int segments,Color circle_color,Color line_color)
    {
        float angle_step = 360f / segments;

        Vector3 center = center_object.position;

        Vector3 start_of_line=center + (max_height_of_step_over) * (transform.up);

        Vector3 end_of_line= center - (max_height_of_step_under) * (transform.up);

        Debug.DrawLine(start_of_line,end_of_line,line_color);

        Vector3 previous_point = center + new Vector3(radius, 0, 0);
        Vector3 previous_vert_point = center + new Vector3(0, radius, 0);
        Vector3 previous_hor_point = center + new Vector3(0, 0, radius);

        for (int i = 1; i <= segments; i++)
        {
            float angle = i * angle_step;
            float x = center.x + radius * Mathf.Cos(Mathf.Deg2Rad * angle);
            float z = center.z + radius * Mathf.Sin(Mathf.Deg2Rad * angle);

            Vector3 current_point = new Vector3(x, center.y, z);
            Debug.DrawLine(previous_point, current_point, circle_color);

            previous_point = current_point;

            float y = center.y + radius * Mathf.Cos(Mathf.Deg2Rad * angle);

            current_point = new Vector3(center.x, y, z);
            Debug.DrawLine(previous_vert_point, current_point, circle_color);

            previous_vert_point = current_point;

            x = center.x + radius * Mathf.Sin(Mathf.Deg2Rad * angle);

            current_point = new Vector3(x, y, center.z);
            Debug.DrawLine(previous_hor_point, current_point, circle_color);

            previous_hor_point = current_point;

        }
    }


    private bool check_timing(float timer,float timing)
    {
        if (Mathf.Abs(timing - timer) < precision)
        {
            return true;
        }
        return false;
    }    
}
