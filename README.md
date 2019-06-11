# Pre-requisite tools
1. Virtual Box https://www.virtualbox.org/wiki/Download_Old_Builds_5_2
2. Vagrant https://www.vagrantup.com/downloads.html
3. VM configuration https://s3.amazonaws.com/video.udacity-data.com/topher/2018/April/5acfbfa3_fsnd-virtual-machine/fsnd-virtual-machine.zip
	* or git clone from https://github.com/udacity/fullstack-nanodegree-vm
	* if using Windows OS, replace vagrantfile with https://s3.amazonaws.com/video.udacity-data.com/topher/2019/March/5c7ebe7a_vagrant-configuration-windows/vagrant-configuration-windows.zip
4. Data https://d17h27t6h515a5.cloudfront.net/topher/2016/August/57b5f748_newsdata/newsdata.zip

# Steps to run the project
1. Start the VM using "vagrant up" and "vagrant ssh"
2. Load the data using "psql -d news -f newsdata.sql"
3. Run the log_analysis.sql file using "psql -d news -f log_analysis.sql"
4. Run the log_analysis.py file using "python log_analysis.py"

# Description of design
1. Create views of the required results
	* VIEW pop_article includes title and article_views (total views of each article)
	* VIEW pop_author includes name and author_views (total views of each author)
	* VIEW view_day get the total number of views in a day
	* VIEW error_day get total number of errors in a day
	* VIEW error_over_1 get the percentage of error_day over view_day
	
2. Use python code to link to the database and run the queries
	* Question 1: Most popular three articles of all time
		get VIEW pop_article and format to the required answers
	* Question 2: Most popular article authors of all time
		get VIEW pop_author and format to the required answers
	* Question 3: The day more than 1% of requests lead to errors
		get VIEW error_over_1 and format to the required answers

# Author
Hunter Zhou