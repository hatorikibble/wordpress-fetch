wordpress-fetch
===============

    usage:
        wordpress_fetch.pl [long options...]
        wordpress_fetch.pl --help

    description:
        this script connects via the XMLRPC API to your Wordpress blog, fetches
        your posts and saves them into the text file '<YEAR>_blog_output.txt'.
    
        If textonly is set, then HTML tags and Wordpress codes are stripped.
    
        You can set the options via the command line or create a JSON config file
        and point the parameter --config to it. (See config.json_example)

    options:
        --blog_url            blog url, e.g. 'http://xyz.wordpress.com' [Required
                                     ]
        --config              Path to command config file
        --help -h --usage -?  Prints this usage information. [Flag]
        --max_posts           number of posts the script should fetch ideally
                                        bigger than your post count, to fetch all your
                                        posts in one go [Default:"250"; Integer]
        --password            Wordpress password [Required]
        --textonly              strip HTML tags and Wordpress codes, default is
                                       false [Flag]
       --username             Wordpress username [Required]
