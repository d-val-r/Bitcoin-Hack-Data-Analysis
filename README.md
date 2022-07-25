# Introduction
The following is a study of a the [Bitcoin Hacked Transactions (2010-2013) dataset](https://ieee-dataport.org/open-access/bitcoin-hacked-transactions-2010-2013#files).
The dataset contains both legitimate and malicious bitcoin transactions, complete with metadata abount the blocks. The dataset marks known malicious blocks. The purpose of 
this study is NOT to expose hacking attempts, but to analyze changes in block metadata when the block was known to be a hacking attempt. 

# Goal
The final output of the study is a series of graphs detailing the changes in metadata across legimiate and malicious blocks in the blockchain.
The graphs are scatter plots where the independent variable (the x-axis) is comprised of individual blocks, ordered chronologically by date and time. Blue dots
represent legitimate transactions, and red dots indicate hacking attempts. 

# Contents
The various files in this project are comprised of Python and bash scripts that organize and prune the data in preparation for analysis in the charter Jypter notebook
(charter.ipynb). The graphs are saved in this Jupyter notebook and can be viewed in the browser by clicking on the file and scrolling down to the output.

# Results
The resultant charts show that various metadata in malicious blocks displays irregular patterns when compared to legitimate transactions.
