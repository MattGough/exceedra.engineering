
---
layout: post
title:  'Password-policies-guildelines-&-db-sys-config'
author: 'ed.jackson@exceedra.com'
exerpt: >
  Guidelines & db sys config 

---

  <p><strong><span style="font-size: 16px;">1. Password policies guidelines</span></strong></p>
<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="1105" style="width: 829pt; margin-left: -0.15pt;">
    <tbody>
        <tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Control</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border:solid windowtext 1.0pt;
            border-left:none;mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Description</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border:solid windowtext 1.0pt;
            border-left:none;mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Supported</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:1;height:105.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:105.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Complexity Controls</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:105.0pt;">
            <p class="MsoNormal"><span style="color: black;">Must
            contain N of<br />
            <br />
            1. Alphabetic Characters (e.g., a-z or A-Z)<br />
            2. Mixed Case Alphabetic Characters (e.g., a-z and A-Z)<br />
            3. Digits (e.g. 0-9)<br />
            4. Special characters (e.g. !@#$%^&amp;*()_+|~- =\`{}[]:";'&lt;&gt;?,./)</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:105.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:2;height:30.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Complexity Controls</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            cannot be common dictionary words</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">No -
            the DB is never sent the password, only the encrypted form, so we do not
            support this.</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:3;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Expiry</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Expiry
            after N days</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:4;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Expiry</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Reset
            on First Login</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:5;height:30.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            History</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Can't
            reuse password from the last N</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes -
            but only exact matches. "Fuzzy" matches are not supported as the DB
            never has the unencrypted password.</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:6;height:30.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">The
            display upon entry or printing of passwords must be secure, masked,
            suppressed, or otherwise obscured.</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:7;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Lock out after N incorrect attempts</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:8;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Entry Delay after N incorrect attempts</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:9;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Account
            must be reenabled by service desk if locked.</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:10;height:30.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            can be reset only once per day</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt;">
            <p class="MsoNormal"><span style="color: black;">No -
            as password reset codes expire after a set number of minutes (default 15) it
            would not be practical to allow only 1 reset a day.</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:11;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            cannot contain user name</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:12;height:15.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">Session
            idle time is 15 minutes</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt;">
            <p class="MsoNormal"><span style="color: black;">No</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:13;height:45.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Password
            Security</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Passwords
            must be maintained in an encrypted or cryptographic hashed format throughout
            all transmissions between computer systems.</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:14;height:45.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Process
            Stuff</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Default
            system passwords, including when distributed by vendor in a default initial
            state, must be changed prior to deployment onto a production network.</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes -
            but this is controlled by Delivery team removing any default passwords in the
            Dim User table.</span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:15;mso-yfti-lastrow:yes;height:45.0pt;">
            <td valign="top" style="width:149.0pt;border:solid windowtext 1.0pt;
            border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
            solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
            0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Process
            Stuff</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">The
            communication of passwords to individuals must be in a manner such that
            unauthorized parties will not be able to observe or subsequently recover
            them.</span></p>
            </td>
            <td valign="top" style="width:340.0pt;border-top:none;border-left:
            none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
            mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
            padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt;">
            <p class="MsoNormal"><span style="color: black;">Yes -
            passwords are never sent to end users from the application. Only password
            reset codes are used.</span></p>
            </td>
        </tr>
    </tbody>
</table>
<p>&nbsp;</p>
<p><span style="font-weight: 700; line-height: 20px; font-size: 16px;">2. Database sys config</span></p>
<table border="1" cellspacing="0" cellpadding="0" width="1453" style="width: 1090pt; border: none;">
    <tbody>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border: 1pt solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">OptionItemDetail</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: solid solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Default Value</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: solid solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Description</span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">PasswordResetCodeDurationInMinutes </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">15</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Determines the amounf of time in minutes for which password reset codes are available </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Minimum_Password_Length </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">8</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies users mininum password length </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Maximum_Password_Length </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">50</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies users maximum password length </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">CannotContainUsername </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">1</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies user password cannot contain their username </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Must_Contain_N_UpperCase </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">4</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies how many upper case characters must be in user passwords </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Must_Contain_N_LowerCase </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">3</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies how many lower case characters must be in user passwords </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Must_Contain_N_Numeric </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">2</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies how many numeric characters must be in user passwords </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Must_Contain_N_SpecialCharacter </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">1</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies how many special characters must be in user passwords </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Must_Contain_ListedSpecialChar </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;"><a href="mailto:N~!@#$%^&amp;*_-+=`|\({}:;'&lt;&gt;,.?/"><span style="color: black;">N~!@#$%^&amp;*_-+=`|\({}:;"&lt;&gt;,.?/</span></a></span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies a list of special characters user passwords must contain </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_LockOut_After_N_Attempts</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">5</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of incorrect password attempts after which the account is locked out </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_LockOut_After_N_Attempts_Time_Window </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">30</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of minutes during which the incorrect password attempts are counted </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Entry_Delay_After_N_Attempts </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">3</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of incorrect password attempts after which an entry delay is enforced </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Entry_Delay_After_N_Attempts_Time_Window </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">30</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of minutes during which the incorrect password attempts are counted </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Entry_Delay_After_N_Attempts_Delay_Seconds </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">10</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of seconds between entry attempts </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Keep_Last_N_Password_History </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">10</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of historic password hashes to keep for checking against password changes </span></p>
            </td>
        </tr>
        <tr style="height: 15pt;">
            <td valign="top" style="height: 15pt; width: 298pt; padding: 0cm 5.4pt; border-style: none solid solid; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Password_Expiry_Days </span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 154pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p style="text-align: right;"><span style="color: black;">90</span></p>
            </td>
            <td valign="top" style="height: 15pt; width: 638pt; padding: 0cm 5.4pt; border-style: none solid solid none; text-align: left; white-space: nowrap;">
            <p><span style="color: black;">Specifies the number of days before a password expires </span></p>
            </td>
        </tr>
    </tbody>
</table>
<p>&nbsp;</p>
<p><strong><span style="font-size: 16px;">3. Newly Added Database Columns</span></strong></p>
<p><span style="font-size: 9.5pt; font-family: Consolas; color: black;">User_PasswordExpiresOn</span><span style="font-size: 9.5pt; font-family: Consolas; color: black;"> &ndash; the datetime stamp that the password expires on. Needs to be populated on new installations.</span></p>
<p>&nbsp;</p>
<p><span style="font-weight: 700; font-size: 16px;">4. Removed Database Columns</span></p>
<p>User_LoginPassword and&nbsp;User_PasswordSalt - both removed as support for unencrypted passwords has been removed.&nbsp;</p>
<p>&nbsp;</p>
<p>A command line application is available from R&amp;D to convert unencrypted&nbsp;passwords into encrypted&nbsp; passwords, or you can expire the password for each user and have them change their own password using the built in mechanism.</p>