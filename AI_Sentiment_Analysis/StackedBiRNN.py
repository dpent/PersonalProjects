import sys
import torch
import torch.nn as nn
import os
from torch.utils.data.dataset import random_split
import re
from collections import Counter, OrderedDict
from torchtext.vocab import vocab
from torch.utils.data import DataLoader
import matplotlib.pyplot as plt
import random

sys.path.insert(0, '..')

filePath="C:\\Users\\dimpe\\Desktop\\cudaTorch\\src\\aclImdb"

train_dataset=[]
test_dataset=[]



def readReviews(type,pathT):
    result_txt = []
    result_label = []

    number_of_reviews =0

    pathT=os.path.join(pathT,type)

    posPath=os.path.join(pathT,"pos")
    negPath=os.path.join(pathT,"neg")
    for name in os.listdir(posPath):
        number_of_reviews +=1
        review=open(os.path.join(posPath,name),mode="r",encoding="utf8",errors="replace")
        result_txt.append(review.read())
        result_label.append(2) # 2 == positive

    for name in os.listdir(negPath):
        number_of_reviews +=1
        review=open(os.path.join(negPath,name),mode="r",encoding="utf8",errors="replace")
        result_txt.append(review.read())
        result_label.append(1) # 1 == negative


    result = list(zip(result_label, result_txt))
    return result


print("train")
train_dataset = readReviews("train",filePath)
random.shuffle(train_dataset)
print("test")
test_dataset = readReviews("test",filePath)
random.shuffle(test_dataset)


torch.manual_seed(1)
train_dataset, valid_dataset = random_split(
    list(train_dataset), [.8, .2])

print(train_dataset)

print(len(train_dataset))
print(len(train_dataset[0]))
print(len(train_dataset[1]))




token_counts = Counter()

def tokenizer(text):
    text = re.sub('<[^>]*>', '', text)
    emoticons = re.findall('(?::|;|=)(?:-)?(?:\)|\(|D|P)', text.lower())
    text = re.sub('[\W]+', ' ', text.lower()) +        ' '.join(emoticons).replace('-', '')
    tokenized = text.split()
    return tokenized


for label, line in train_dataset:
    tokens = tokenizer(line)
    token_counts.update(tokens)
 
    
print('Vocab-size:', len(token_counts))





sorted_by_freq_tuples = sorted(token_counts.items(), key=lambda x: x[1], reverse=True)
ordered_dict = OrderedDict(sorted_by_freq_tuples)

vocab = vocab(ordered_dict)

vocab.insert_token("<pad>", 0)
vocab.insert_token("<unk>", 1)
vocab.set_default_index(1)




device = 'cpu'

text_pipeline = lambda x: [vocab[token] for token in tokenizer(x)]
label_pipeline = lambda x: 1. if x == 2 else 0.


def collate_batch(batch):
    label_list, text_list, lengths = [], [], []
    for _label, _text in batch:
        label_list.append(label_pipeline(_label))
        processed_text = torch.tensor(text_pipeline(_text), 
                                      dtype=torch.int64)
        text_list.append(processed_text)
        lengths.append(processed_text.size(0))
    label_list = torch.tensor(label_list)
    lengths = torch.tensor(lengths)
    padded_text_list = nn.utils.rnn.pad_sequence(
        text_list, batch_first=True)
    return padded_text_list.to(device), label_list.to(device), lengths.to(device)





batch_size = 512

train_dl = DataLoader(train_dataset, batch_size=batch_size,
                      shuffle=True, collate_fn=collate_batch)
valid_dl = DataLoader(valid_dataset, batch_size=batch_size,
                      shuffle=False, collate_fn=collate_batch)
test_dl = DataLoader(test_dataset, batch_size=batch_size,
                     shuffle=False, collate_fn=collate_batch)




         
vocab_size = len(vocab)
embed_dim = 20
rnn_hidden_size = 8
fc_hidden_size = 8
num_layers=4

trainLoss=[]
evalLoss=[]




def train(dataloader):
    model.train()
    total_acc, total_loss = 0, 0
    true_positive = 0
    false_positive = 0

    true_negative = 0
    false_negative = 0

    for text_batch, label_batch, lengths in dataloader:
        


        optimizer.zero_grad()
        pred = model(text_batch, lengths)[:, 0]
        loss = loss_fn(pred, label_batch)
        loss.backward()
        optimizer.step()

        
        true_positive += (torch.logical_and((pred>=0.5),(label_batch>=0.5))).float().sum().item()
        false_positive += (torch.logical_and((pred>=0.5),(label_batch<0.5))).float().sum().item()

        true_negative += (torch.logical_and((pred<0.5),(label_batch<0.5))).float().sum().item()
        false_negative += (torch.logical_and((pred<0.5),(label_batch>=0.5))).float().sum().item()



        positive = (label_batch>=0.5).float().sum().item()
        negative = (label_batch<0.5).float().sum().item()

        print("Train : True")
        print(true_positive)
        print(true_negative)

        
        total_acc += ((pred>=0.5).float() == label_batch).float().sum().item()
        total_loss += loss.item()*label_batch.size(0)
        print("b")

    trainLoss.append(total_loss)
    precision = 1#true_positive/(true_positive+false_positive)
    recall = 1#true_positive/(true_positive+false_negative)
    return total_acc/len(dataloader.dataset), total_loss/len(dataloader.dataset),  precision, recall
 
def evaluate(dataloader,type):
    model.eval()
    total_acc, total_loss = 0, 0

    
    true_positive = 0
    false_positive = 0

    true_negative = 0
    false_negative = 0
    precision=0
    recall=0
    

    with torch.no_grad():
        for text_batch, label_batch, lengths in dataloader:
            pred = model(text_batch, lengths)[:, 0]
            loss = loss_fn(pred, label_batch)
            
            positive = (label_batch>=0.5).float().sum().item()
            negative = (label_batch<0.5).float().sum().item()

            print(positive)
            print(negative)


            true_positive += (torch.logical_and((pred>=0.5),(label_batch>=0.5))).float().sum().item()
            false_positive += (torch.logical_and((pred>=0.5),(label_batch<0.5))).float().sum().item()

            true_negative += (torch.logical_and((pred<0.5),(label_batch<0.5))).float().sum().item()
            false_negative += (torch.logical_and((pred<0.5),(label_batch>=0.5))).float().sum().item()

            print("Validate: True")
            print(true_positive)
            print(true_negative)

            

            total_acc += ((pred>=0.5).float() == label_batch).float().sum().item()
            total_loss += loss.item()*label_batch.size(0)
    if (true_positive+false_positive)>0.0:
        precision = true_positive/(true_positive+false_positive)
    if (true_positive+false_negative)>0.0:
        recall = true_positive/(true_positive+false_negative)
    
    print("Eval stats:")
    print(precision)
    print(recall)

    if type==1:
        if(true_negative+false_negative)>0.0:
            precisionL=true_negative/(true_negative+false_negative)
        else:
            precisionL=0.0
        print("Συνολικό precision για τα αρνητικά: "+str(precisionL))
        if(true_negative+false_positive)>0.0:
            recallL=true_negative/(true_negative+false_positive)
        else:
            recallL==0.0
        print("Συνολικό recall για τα αρνητικά: "+str(recallL))
        precisionP=precision
        print("Συνολικό precision για τα θετκά: "+str(precision))
        recallP=recall
        print("Συνολικό recall για τα θετικά: "+str(recall))
        if(precisionP+recallP)>0.0:
            f1P=2*((precisionP*recallP)/(precisionP+recallP))
        else:
            f1P=0.0
        print("Συνολικό f1 για τα θετικά: "+str(f1P))
        if(precisionL+recallL)>0.0:
            f1L=2*((precisionL*recallL)/(precisionL+recallL))
        else:
            f1L=0
        print("Συνολικό f1 για τα αρνητικά: "+str(f1L))
        macroPrec=(precisionL+precisionP)/2
        print("Macro Precision: "+str(macroPrec))
        macroRec=(recallL+recallP)/2
        print("Macro Recall: "+str(macroRec))
        if(true_positive+true_negative+false_positive+false_negative)>0.0:
            microPrec=(true_positive+true_negative)/(true_positive+true_negative+false_positive+false_negative)
        else:
            microPrec=0
        print("Micro Precision: "+str(microPrec))
        if(true_positive+true_negative+false_negative+false_positive)>0.0:
            microRec=(true_positive+true_negative)/(true_positive+true_negative+false_positive+false_negative)
        else:
            microPrec=0
        print("Micro Recall: "+str(microRec))
    evalLoss.append(total_loss)
    try:
        return total_acc/len(dataloader.dataset), total_loss/len(dataloader.dataset),  precision, recall
    except:
        return 0.0, 0.0, precision, recall

class RNN(nn.Module):
    def __init__(self, vocab_size, embed_dim, num_layers,rnn_hidden_size):#, fc_hidden_size):
        super().__init__()
        self.embedding = nn.Embedding(vocab_size, 
                                      embed_dim, 
                                      padding_idx=0) 
        self.rnn = nn.LSTM(embed_dim, rnn_hidden_size, num_layers=num_layers,
                           batch_first=True, bidirectional=True)
        self.fc1 = nn.Linear(rnn_hidden_size*2, 1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, text, lengths):
        out = self.embedding(text)
        out = nn.utils.rnn.pack_padded_sequence(out, lengths.cpu().numpy(), enforce_sorted=False, batch_first=True)
        _, (hidden, cell) = self.rnn(out)
        out = torch.cat((hidden[-2, :, :], hidden[-1, :, :]), dim=1)
        out = self.fc1(out)
        out = self.sigmoid(out)
        return out
    
torch.manual_seed(1)
model = RNN(vocab_size, embed_dim,num_layers, rnn_hidden_size)#, fc_hidden_size) 
model = model.to(device)




loss_fn = nn.BCELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.002)

num_epochs = 10 

torch.manual_seed(1)
epochs=[1,2,3,4,5,6,7,8,9,10]

for epoch in range(num_epochs):
    acc_train, loss_train, precision, recall = train(train_dl)
    acc_valid, loss_valid, precision, recall = evaluate(valid_dl,0)
    print(f'Epoch {epoch} accuracy: {acc_train:.4f} val_accuracy: {acc_valid:.4f}')





if True:
    plt.figure(figsize=(20,10))
    plt.subplot(1, 2, 1)
    plt.plot(epochs,trainLoss,'b--')
    plt.ylabel('Train Loss')
    plt.xlabel('Epochs')
    plt.subplot(1, 2, 2)  
    plt.plot(epochs,evalLoss,'r--')
    plt.ylabel('Eval Loss')
    plt.xlabel('Epochs')
    plt.show()


acc_test, _, _, _ = evaluate(test_dl,1)
print(f'test_accuracy: {acc_test:.4f}') 

