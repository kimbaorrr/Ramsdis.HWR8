#Vui long set ssfree chay every 10 mins ( Set "ssfree" software run every 10 mins )
#Lenh chinh ( Main Code )
$mainzone = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
    (Get-Date), 'Cape Verde Standard Time')

    $date = $mainzone.Tostring("yyyyMMdd") 

   $time = $mainzone.AddMinutes(-10).Tostring("HHmm") #-10 phut moi khi chay chuong trinh 

   #Tai hinh anh ( Download image )
   
   $a = (Get-Date -Format "ddMMyyyy") #Set $a $b Local time zone 
   $b = (Get-Date -Format "HHmm")     

   New-Item -ItemType directory -Path D:\Himawari-8\$a #Create Folder if not exist
   
   #Invoke Download
   
   $out = ("D:\Himawari-8\$a\$b"+".jpg")#Save image with name.jpg?
   
   $url = ("http://rammb.cira.colostate.edu/ramsdis/online/images/himawari-8/full_disk_ahi_true_color/full_disk_ahi_true_color_"+"$date"+"$time"+"00"+".jpg")
   
   
Invoke-WebRequest -Uri $url -OutFile $out 

  