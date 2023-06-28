mkdir files

cd files

# Download
kaggle datasets download -d linrock/nn-e1fb1ade-v6-dd-filtered-training-data/test80-jan2022-3of3-16tb7p-filter-v6-dd.min-mar2023.binpack.zst -f test80-jan2022-3of3-16tb7p-filter-v6-dd.min-mar2023.binpack.zst
kaggle datasets download -d linrock/nn-e1fb1ade-v6-dd-filtered-training-data/test80-jan2022-3of3-16tb7p-filter-v6-dd.min-mar2023.binpack.zst -f test60-novdec2021-12tb7p-filter-v6-dd.min-mar2023.binpack.zst

# Extract
p7zip x test80-jan2022-3of3-16tb7p-filter-v6-dd.min-mar2023.binpack.zst.zip
p7zip x test60-novdec2021-12tb7p-filter-v6-dd.min-mar2023.binpack.zst.zip

zstd -d test80-jan2022-3of3-16tb7p-filter-v6-dd.min-mar2023.binpack.zst
zstd -d test60-novdec2021-12tb7p-filter-v6-dd.min-mar2023.binpack.zst