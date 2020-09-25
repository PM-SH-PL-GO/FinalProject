<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="basic.css" />
    <style>
    html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}
body {
  line-height: 1;
}
ol,
ul {
  list-style: none;
}
blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

.body-center {
  margin: 0 auto;
  /* border: 1px solid blue; */
  margin: 0 auto;
  width: 66%;
}

.container-center {
  width: 66%;
  margin: 0 auto;
  /* border: 1px solid red; */
}

.header h1 {
  margin-top: 40px;
  font-weight: bold;
  font-size: 2.5rem;
}

.herder-border {
  margin-top: 24px;
  border-bottom: 2px solid #000000;
}

.head-photo {
  width: 250px;
  height: 250px;
  margin: 30px 0;
}

.title {
  text-transform: uppercase;
  font-weight: bold;
  position: relative;
}

.title h4 {
  display: inline-block;
  margin-right: 10px;
  font-size: 1.5rem;
  color: black;
}

.title h6 {
  display: inline-block;
  color: #a00404;
  top: 0px;
  font-size: 1.2rem;
  position: absolute;
}

.title-border {
  margin-top: 10px;
  margin-bottom: 15px;
  border-bottom: 1px solid #000000;
}

.person-detail p {
  line-height: 1.5rem;
  margin-bottom: 20px;
}

.profile-detail p {
  line-height: 1.5rem;
  margin-bottom: 50px;
}
.education {
  line-height: 2rem;
  margin-bottom: 50px;
}

.skill {
  color: white;
  background-color: #415165;
  padding-top: 20px;
}

.skill-title {
  text-align: center;
  margin: 0 auto;
  width: 80%;
}

.skill-title h2 {
  margin-right: 5px;
  font-size: 1.5rem;
  display: inline-block;
}

.skill-title h4 {
  font-size: 1.2rem;
  display: inline-block;
}

.skill-border {
  margin-top: 10px;
  margin-bottom: 30px;
  border-bottom: 1px solid white;
}

.skill-content {
  /* text-align: center; */
  padding-bottom: 10px;
  width: 20%;
  margin: 0 auto;
  margin-bottom: 50px;
}

.skill-content ul {
  /* text-align: center; */
  border-left: 1px solid #96a9c4;
}

.skill-content li {
  margin-bottom: 1rem;
  text-align: left;
  font-weight: 100;
  font-size: 1.1rem;
  margin-left: 20px;
}

.work-exp {
  width: 55%;
  border-left: 1px solid#96A9C4;
  padding-left: 15px;
}

.work-exp h3 {
  font-size: 1.1rem;
  text-align: left;
  font-weight: bold;
  margin-bottom: 5px;
}

.work-exp p {
  font-size: 15px;
  line-height: 1.3;
}

.logo-group {
  width: 15%;
  height: 15%;
  margin-bottom: 5px;
}

.logo-tree {
  width: 10%;
  height: 10%;
  margin-bottom: 5px;
}

.work-exp li {
  margin-top: 2.5rem;
  text-align: left;
  font-weight: 100;
  font-size: 1.1rem;
  font-weight: bold;
}

.footer {
  background-color: #415165;
  margin-top: 30px;
}

.footer-title {
  text-align: center;
  margin: 0 auto;
  width: 70%;
  color: #ffffff;
  padding-top: 24px;
}

.footer-border {
  margin-top: 10px;
  margin-bottom: 20px;
  border-bottom: 1px solid white;
}

.footer h2 {
  display: inline-block;
  font-size: 1.5rem;
}

.footer-content {
  font-size: 1.1rem;
  color: #ffffff;
  text-align: center;
}

.footer p {
  padding-bottom: 20px;
}

.footer-img-container {
  text-align: center;
  padding-bottom: 48px;
}

.footer-img-container img {
  margin-right: 20px;
  height: 36px;
  width: 36px;
}
    </style>
  </head>
  <body>
  
    <div class="body-center">
      <div class="container-center">
        <div class="header">
          <h1>
         ${t}
            <br />
          </h1>
          <div class="herder-border"></div>
        </div>
        <div class="profile">
          <img src="https://raw.githubusercontent.com/hexschool/webLayoutTraining1st/master/week1/photo.png" alt="" class="head-photo" />
          <div class="title">
            <h4>個人資料</h4>
            <h6>profile</h6>
            <div class="title-border"></div>
          </div>
          <div class="person-detail">
            <p>
              陳久安 Joanne Chen<br />
              1997- <br />應屆畢業生／接案設計師／UI 設計實習生
            </p>
          </div>
          <div class="profile-detail">
            <p>
              UI 設計修行中／立志當斜槓青年<br />
              獨立接案，內容涵蓋：<br />
              品牌規劃、視覺設計、編輯設計、標準字、物件及印刷品設計等。
            </p>
          </div>
          <div class="title">
            <h4>學歷</h4>
            <h6>education</h6>
            <div class="title-border"></div>
          </div>
          <div class="education">
            <p>
              國立六角師範大學 視覺設計學系 學士學位 | 2016－2020 <br />
              國立六腳高級中學 美術班 | 2013－2016
            </p>
          </div>
          <div class="skill">
            <div class="skill-title">
              <h2>技能</h2>
              <h4>SKILLS</h4>
              <div class="skill-border"></div>
            </div>
            <div class="skill-content">
              <ul>
                <li>${t.member.member_name}</li>
                <li>Adobe Illustrator</li>
                <li>Adobe XD</li>
                <li>Adobe Indesign</li>
                <li>C4D</li>
                <li>Adobe Premiere</li>
                <li>語言：中文、英文</li>
              </ul>
            </div>
          </div>
          <div class="title">
            <h4>工作經驗</h4>
            <h6>WORK EXPERIENCE</h6>
            <div class="title-border"></div>
          </div>
          <div class="work-exp">
            <h3>六角學院 視覺設計實習生 | 2019/07－2020/06</h3>
            <img src="https://raw.githubusercontent.com/hexschool/webLayoutTraining1st/master/week1/Group%201.svg" alt="" class="logo-group" />
            <p>
              在六角學院長達一年的實習中，前期藉由公司課程掌握 HTML, CSS, Adobe
              XD，設計給學員使用的名片設計教材，並參與六角週年活動，
              設計各式周邊商品及活動網路宣傳圖。後期進入 UI 設計範疇，設計六角共筆部落格 -
              W3HexSchool、六角發案服務網介面設計、供給學員的教 案-
              RWD官方網站設計，並設計各式網頁活動宣傳圖。
            </p>
            <ul>
              <li>獨立接案 Hao Jun 酒標設計 | 2019</li>
              <li>獨立接案 Exulans 酒標設計 | 2019</li>
              <li>獨立接案 桃園平鎮市民健走活動提案 | 2019</li>
              <li>Simtree 興趣咖啡 工讀生 | 2018－2019</li>
            </ul>
            <img src="https://raw.githubusercontent.com/hexschool/webLayoutTraining1st/master/week1/simtree.png" alt="" class="logo-tree" />
            <p>擔任外場及吧台服務生，學習咖啡相關知識。</p>
          </div>
        </div>
      </div>
      <div class="footer">
        <div class="footer-title">
          <h2>聯絡方式</h2>
          <p>METHOD</p>
          <div class="footer-border"></div>
        </div>
        <div class="footer-content">
          <p>Mail：xxxd@hexschool.com</p>
          <p>Phone：0910123456</p>
          <p>Kaohsiung, Taiwan</p>
          <p>作品連結：https://www.behance.net/xxxdddddd</p>
        </div>
        <div class="footer-img-container">
          <img src="https://raw.githubusercontent.com/hexschool/webLayoutTraining1st/master/week1/facebook.svg" alt="" />
          <img src="https://raw.githubusercontent.com/hexschool/webLayoutTraining1st/master/week1/instagram-alt.svg" alt="" />
          <img src="https://raw.githubusercontent.com/hexschool/webLayoutTraining1st/master/week1/line.svg" alt="" />
        </div>
      </div>
    </div>
  </body>
</html>