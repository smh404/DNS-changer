# DNS-changer

Windows cmd bat file to change dns

*Be Shure To change your Interfacename in the middle*

اسکریپت تغییر DNS ویندوز از طریق CMD در قالب فایل bat

*تغییر اسم اینترفیس در فایل فراموش نشود*
<h6>
نحوه کار اسکریپت:
اول جلوی قسمت InterfaceName اسم اینترفیس خود را (که داخل کنترل پنل change adapter opntions میتونید پیدا کنید) قرار بدید و فایل رو سیو کنید و باز کنید(دسترسی ادمین میگیرد).
  
سپس بعد از انتخاب دی ان اس مورد نظر اینتر بزنید تا دی ان اس انتخابی روی اینترفیس ست بشه در این مرحل اول دی ان اس های شما روی DHCP قرار میگیره* و بعد دی ان اس اول و دوم روی اینترفیستون ست میشه.

*با انتخاب هر دی ان اس اسکریپت اول دی ان اس شما رو روی DHCP قرار میده و بعد دی ان اس های انتخابی رو اعمال میکنه تا از پشت هم قرار گرفتن چندین دی ان اس روی اینترفیس جلوگیری بشه.

پ.ن: برای اینکه بعد اعمال دی ان اس cmd به صورت خودکار بسته بشه میتونید pause رو از آخر اسکریپت بردارید


How it works:
First you change the interface name at the top of the file with your devices active interface name (which you can find in control panel change adapter opntions) then save and run the file(asks for admin rights).

Then you choose an option in the cmd and hit enter And the bat file will change your interface dns to dhcp fisrt* then change the primary and seccondary dns server to your desired ones.

*every option in the script changes your dns to dhcp first and then applies the dns servers to avoid your interface getting more than two servers every time.

p.s : you can remove the pause at the end if you want the cmd to close automatically after you choose a server
