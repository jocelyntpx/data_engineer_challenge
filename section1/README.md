# Section 1

### Instructions to schedule cronjob on server

1. Copy file into your server (via sftp or scp).
2. Go into your server (via ssh or other means)
3. Enter crontab configuration `crontab -e`
4. Add a new line  `10 1 * * * <full path to python binary> <full path to python script>` 
    - e.g. `10 1 * * * /Library/Frameworks/Python.framework/Versions/3.9/bin/python3 /Users/jocelyn/Desktop/data_engineer_challenge/section1/section1.py`
    - this will configure the script to run at 1.10 am every day to give some buffer time for the data to be available
5. Save and exit.


### Files
- input_dataset: folder containing the input datasets
- processed_dataset: folder containing the output dataset
- section1.py: script to process data

### Limitations
- Made the assumption that the dataset uploaded will be accurate, did not do checks on the availability of columns required (name, price) before merging the datasets and doing pre-processing
- Removed name titles (name column) that match patterns in section1.py line 23. I have added the common titles used, however, there could be other titles and I might have missed them out. A way we can work on this is to constanrly add titles on to the pattern whenever we come across a title not in the pattern.
- Made the assumption that name contains (first name, last name) or (title, first name, last name), but there could be other formats e.g. include middle name. For this, it is better if we can ensure that the name column will only have at most 2 words (first name and last name). Different solutions can be used depending on how we are collecting the customers' names. For instance, if it is through a form, we can ask them to indicate their first name and last name separately. We will then not need to separate them ourselves. 
