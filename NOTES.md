# Usage

```
IMAGE=josh/deeplab:tf1.1_p27
NAME=josh_train_deeplab
LOCAL_PORT=8999
VOLUME=`pwd`
GPU=3

nvidia-docker run -it --entrypoint bash \
  -v $VOLUME:/opt/silverbrane/deeplab/ \
  --name $NAME \
  -p $LOCAL_PORT:8888 \
  --env CUDA_VISIBLE_DEVICES=$GPU \
  $IMAGE

$python train.py --data-dir dataset/VOCdevkit/VOC2012/ --random-mirror --random-scale
```
# Download initial checkpoints

- deeplab_resnet.ckpt 
- deeplab_resnet_init.ckpt

From https://drive.google.com/drive/folders/0B_rootXHuswsZ0E4Mjh1ZU5xZVU

It is a bit tricky to `wget` from Google Drive but I found this function that helps:

```
function gdrive_download () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}


# Do download the above 2 checkpoints. ID is the google drive id at the end of 
# each of the files at the Drive link above

ID=0B_rootXHuswsenNCZllQQUJkYUU
gdrive_download $ID deeplab_resnet_init.ckpt

ID=0B_rootXHuswsVGY4ZFRydXJBR1E
gdrive_download $ID deeplab_resnet.ckpt

```

# Download VOC2012

```
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
tar -xvf VOCtrainval_11-May-2012.tar
```

# Download VOC2012 AUG

```
wget https://www.dropbox.com/s/oeu149j8qtbs1x0/SegmentationClassAug.zip
unzip SegmentationClassAug.zip
```

# Move to dataset directory
```
mkdir dataset

```
