
import csv, sys, glob, os
sys.path.insert(0, './AutoSALT')
from MLUM import MLUM
reload(sys)
sys.setdefaultencoding("utf-8")


def wrapper(file):
    all_utts = []
    in_file = file
    with open(in_file, "r+") as f:
        for line in f.readlines():
            line = line.strip()
            line = line.split(" ")
            timestamps = line[0]
            utt = line[1:]
            all_utts.append(utt)
    result = MLUM(all_utts)
    return result


def main(folder, filepath):
    print(folder)
    with open(filepath, "w+") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['file_name', "MLUM"])
        for file in glob.glob(folder + "*.txt"):
            print(file)
            mlum = wrapper(file)
            print(mlum)
            writer.writerow([file, mlum])

if __name__=='__main__':
    main(sys.argv[1], sys.argv[2])

'''
example command:
python mlum_csv.py /home/asd-lang/salem/MLU_project/desalinated/FNL_chron_desalinated/ /home/asd-lang/salem/MLU_project/FNL_mlum.csv
'''