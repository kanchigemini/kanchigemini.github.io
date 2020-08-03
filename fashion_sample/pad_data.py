from keras.preprocessing.image import load_img, img_to_array
from keras.preprocessing.image import ImageDataGenerator
import matplotlib.pyplot as plt
import numpy as np
import os
import glob

# 入力ディレクトリを作成
input_dir = "data"
decay_files = glob.glob(input_dir + '/decay/*.jpg')
healthy_files = glob.glob(input_dir + '/healthy/*.jpg')

# 出力ディレクトリを作成
output_dir = "train"
if os.path.isdir(output_dir) == False:
    os.makedirs(output_dir+"/decay")
    os.makedirs(output_dir+"/healthy")


for i, file in enumerate(decay_files):
    print(i)

    img = load_img(file)
    x = img_to_array(img)
    x = np.expand_dims(x, axis=0)

    # ImageDataGeneratorの生成
    datagen = ImageDataGenerator(
        rotation_range=30.0
    )

    # 9個の画像を生成します
    g = datagen.flow(x, batch_size=1, save_to_dir=output_dir+"/decay", save_prefix='img', save_format='jpg')
    for i in range(9):
        batch = g.next()

for i, file in enumerate(healthy_files):
    print(i)

    img = load_img(file)
    x = img_to_array(img)
    x = np.expand_dims(x, axis=0)

    # ImageDataGeneratorの生成
    datagen = ImageDataGenerator(
        rotation_range=30.0
    )

    # 9個の画像を生成します
    g = datagen.flow(x, batch_size=1, save_to_dir=output_dir+"/healthy", save_prefix='img', save_format='jpg')
    for i in range(9):
        batch = g.next()