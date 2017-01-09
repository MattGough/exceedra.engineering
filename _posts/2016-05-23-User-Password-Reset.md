
---
layout: post
title:  'User-Password-Reset'
author: 'chillfire'
exerpt: >
  Self service password resets for users, both front and back end workflow 

---

  <p>User workflow:</p>
<p>Click on "Forgotten password" on login screen, new pop up appears</p>
<p><img alt="" src="/media/Login/reset%20password%20pic.png" /></p>
<p>Back end process:</p>
<p><img alt="" src="/media/Login/reset%20password%20pic%202.png" /></p>
<p>&nbsp;</p>
<p><strong>Tables affected: </strong></p>
<p>Dim_Users<br />
Fact_User_PasswordResetCode<br />
SYS_Queue_Emails</p>
<p>&nbsp;</p>
<p><strong>Procs:</strong></p>
<p>app.Procast_SP_LOGIN_ForgottenPassword_GetDetails: which sets reset code and adds email into email queue.<br />
app.Procast_SP_LOGIN_ForgottenPassword_SavePassword: validates data and saves new password</p>
<p>&nbsp;</p>
<p>&nbsp;</p>