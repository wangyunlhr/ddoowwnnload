#!/bin/bash
#vkitti 14.6G 室外虚拟----------------1-------------------
mkdir vkitti
cd vkitti

wget https://download.europe.naverlabs.com//virtual_kitti_2.0.3/vkitti_2.0.3_rgb.tar
tar -xvf vkitti_2.0.3_rgb.tar

wget https://download.europe.naverlabs.com//virtual_kitti_2.0.3/vkitti_2.0.3_depth.tar
tar -xvf vkitti_2.0.3_depth.tar

wget https://download.europe.naverlabs.com//virtual_kitti_2.0.3/vkitti_2.0.3_textgt.tar.gz
tar -xvf vkitti_2.0.3_textgt.tar.gz


cd ..
# co3dv2 单物体 完整数据集 5.5T 单序列 17G ----------------2-------------------
mkdir -p co3dv2
git clone https://github.com/facebookresearch/co3d.git
cd co3d

echo "Choose co3dv2 download mode:"
echo "1. Download full dataset (≈5.5TB)"
echo "2. Download single-sequence subset only (≈17GB)"
read -p "Enter your choice [1/2]: " choice

if [ "$choice" = "1" ]; then
    echo "Downloading FULL CO3Dv2 dataset..."
    python ./co3d/download_dataset.py --download_folder ../co3dv2/
elif [ "$choice" = "2" ]; then
    echo "Downloading SINGLE-SEQUENCE subset only..."
    python ./co3d/download_dataset.py --download_folder ../co3dv2/ --single_sequence_subset
else
    echo "Invalid choice. Please enter 1 or 2."
fi

cd ..