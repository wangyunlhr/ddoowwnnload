from huggingface_hub import snapshot_download
import os

# 设置要下载的数据集仓库 ID
dataset_id = "JianyuanWang/co3d_anno"

# 设置本地下载路径
download_dir = "/data1/dataset/co3d_anno"  # ← 根据你机器的路径修改

# 确保路径存在
os.makedirs(download_dir, exist_ok=True)

# 下载整个数据集仓库（包括 .jgz 等全部文件）
snapshot_download(
    repo_id=dataset_id,
    repo_type="dataset",                 # 重要：标明是数据集
    local_dir=download_dir,
    local_dir_use_symlinks=False        # 避免使用软链接
)