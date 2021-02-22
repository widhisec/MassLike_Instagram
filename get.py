try:
	import requests,json,sys,re
except Exception as oke:
	raise (oke)
def biasalah(url=True):
    with requests.Session() as req:
    	ses = req.get(url, cookies={"csrftoken":sys.argv[1]})
    	with open("fot.txt",'w') as file: 
    	  for x in (re.findall('(?<="shortcode":")[^"]*',ses.text)):
              file.write("https://instagram.com/p/%s\n" % (x))
    		

if __name__ == '__main__':
	biasalah(f"https://www.instagram.com/{sys.argv[2]}")
