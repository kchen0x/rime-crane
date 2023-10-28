original_dict = "others/python/小鹤音形for手机搜狗百度自定义方案.txt"
fly_dict = "flypy.dict.yaml"
fly_sys = "cn_dicts/flypy_sys.txt"

with open(original_dict, "r", encoding="utf-8") as f:
    lines = f.readlines()

# Outputting first part to output.txt
with open(fly_dict, "w", encoding="utf-8") as f:
    header = """# Rime dictionary
# encoding: utf-8
#
# flypy - flypy
#
#   derived from flypy table.
#

---
name: flypy
version: "10.9.4"
sort: original
# use_preset_vocabulary: true
# max_phrase_length: 7
# min_phrase_weight: 100
...
"""
    f.write(header)
    for line in lines:
        if line.startswith("# 1.首选"):
            continue
        if line.startswith("# 2.次选"):
            break
        f.write(line)

# Outputting second part to output2.txt
with open(fly_sys, "w", encoding="utf-8") as f:
    header = """# coding: utf-8
# 小鹤音形（简）辅库
# 该文件以UTF-8编码保存
# 编码格式：字词+Tab符+编码（词库本身有重码则还需后面+Tab符+权重，权重大者居前，权重数字随意）
#    === 强调一下 === 
# 
#   词条和编码之间的不是空格，而是Tab符，如果你不知道，就复制下面编码中的空白处
#   或者按住键盘 G 键，切换到功能键盘，使用上面的Tab键
# 
#    ================
# 包含如下词库：
# 	1. 快符
# 	2. 次选
# 	3. 填空
# 	4. 表外字
# 	5. 符号
# 	6. 随心
# 	7. 二重简码

# 1.快符
：“	;q
？	;w
（	;e
）	;r
@	;t
《	;y
》	;u
[	;o
]	;p
！	;a
……	;s
、	;d
“	;z
→	;x
”	;c
——	;v
"""
    f.write(header)
    for line in lines:
        if line.startswith("# 2.次选"):
            f.write(line)
            f.writelines(lines[lines.index(line)+1:])
            break