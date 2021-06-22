try:
	import requests,json,sys,re
except Exception as oke:
	raise (oke)
if sys.version[0] in '2':
   print('[x] No Supported For python 2.x Please Use Python 3.x \n')
   exit(1)
def biasalah(url=True):
    with requests.Session() as req:
    	ses = req.get(url, cookies={"csrftoken":sys.argv[1]})
    	with open("fot.txt",'w') as file: 
    	  for x in (re.findall('(?<="shortcode":")[^"]*',ses.text)):
              file.write("https://instagram.com/p/%s\n" % (x))
    		
if (len (sys.argv)) != 2:
    print (str(TypeError("Usage: python ex.py token https://instagram.com/blalala ")))
    sys.exit(1)
if __name__ == '__main__':
	biasalah(f"https://www.instagram.com/{sys.argv[2]}")
