# SNS-CF: Siamese Network and Spatially Semantic Features for Object Tracking. #
**Bref**: SNS-CF is developed by **Ntwari Thierry** during a master course at Chungang University,
South Korea under **IPIS Lab** (Information Processing and Intelligent Systems Laboratory). It
implements several *visual tracking algorithms* including a brand new **SNS-CF**. Enjoy the
ride...

# MDPI sensors published manuscript: https://doi.org/10.3390/s20174881

<p align="center">
  <img src="misc/Benchmark.gif" width="1641">
</p>

## Installation
### Create the conda environment
```shell script
conda env create -f environment.yml
conda activate SNS-CF
```
### Build the vot toolkits
```shell script
bash benchmark/make_toolkits.sh
```
## Get the Models

The .pth for SiamFC is already in the repo since it is small. 
The SiamRPN and SiamMask models need to be downloaded and moved to their respective sub-folder.

**SiamRPN**
Get model [here](https://drive.google.com/file/d/1lVxoZfGo5M7DBbVP0NVHecOAfYFqtfgk/view?usp=sharing)
&rarr; move to ./trackers/SiamRPN/model.pth

**SiamMask**

Download the model and move to sub-folder
```shell script
wget http://www.robots.ox.ac.uk/~qwang/SiamMask_VOT.pth
mv SiamMask_VOT.pth trackers/SiamMask/model.pth
```
## Get the Datasets
Run the download script to get the [OTB2015](http://cvlab.hanyang.ac.kr/tracker_benchmark/benchmark_v10.html)
 and [VOT2018](http://www.votchallenge.net/vot2018/) datasets.
```shell script
cd data/
bash get_test_data.sh
```
## Reproduce the benchmark results
<p align="center">
  <img src="misc/SNS-CF.png" width="1641">
</p>
To reproduce the benchmark results from the paper run for example:

### On VOT2018, with SNS-CF
```shell script
python bench.py -d VOT2018 -t SiamRPN
```
#### On VOT2018, with SNS-CF and visualizations on
```shell script
python bench.py -d VOT2018 -t SiamRPN --viz
```

#### On VOT2018, with SNS-CF and verbose mode on
```shell script
python bench.py -d VOT2018 -t SiamRPN --verbose
```

#### On VOT2018, with SNS-CF and with a specific video
```shell script
python bench.py -d VOT2018 -t SiamRPN --spec_video VIDEO_NAME
```

```
Option     | |
-------- | ---
``-d DATASET, --dataset DATASET``| ``(Required) Dataset on which the benchmark is run [VOT2018, OTB2015]``
``-t TRACKER, --tracker TRACKER``| ``(Required) Name of the tracker [SiamFC, SiamRPN, SiamMask]``
``-v, --viz``| `` Show the tracked scene, the stored templated and the modulated view``
``--verbose``| `` Print additional info about THOR``
``--spec_video VIDEO_NAME``| `` Pick a specific video by name, e.g. "lemming" on OTB2015``
```
## Webcam demo
<p align="center">
  <img src="misc/Webcam.gif" width="800">
</p>
To run **SNS-CF** on your webcam / camera, run the following commands
#### With SNS-CF (ensemble) enabled, using SiamRPN
```shell script
python webcam_demo.py --tracker SiamRPN
```

#### With SNS-CF and visualizations on
```shell script
python webcam_demo.py --tracker SiamRPN --viz
```

#### With SNS-CF and verbose mode on
```shell script
python webcam_demo.py --tracker SiamRPN --verbose
```

```
Option     | |
-------- | ---
``-t TRACKER, --tracker TRACKER``| ``(Required) Name of the tracker [SiamFC, SiamRPN, SiamMask]``
``-v, --viz``| `` Show the stored templated and the modulated view``
``--verbose``| `` Print additional info about THOR``
```

## Acknowledgments
The code (with some modifications) and models of the trackers are from the following linked repositories:

[SiamFC](https://github.com/huanglianghua/siamfc-pytorch),
[SiamRPN](https://github.com/foolwood/DaSiamRPN),
[SiamMask](https://github.com/foolwood/SiamMask),
[THOR](https://github.com/xl-sr/THOR),
[SNS-CF](https://github.com/jonthierry/SNS-CF)
```

******************************** ©jonthierry 2020 ***********************************
