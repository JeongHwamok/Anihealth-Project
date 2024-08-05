<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANIHEALTH</title>
    <style>
        @font-face {
            font-family: 'WavvePADO-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: 'WavvePADO-Regular';
        }
        body {
            background: #6ac9a9;
            color: #fff;
            font-family: 'Open Sans', sans-serif;
            max-height: 700px;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .c {
            text-align: center;
            position: relative;
            width: 80%;
        }
        ._404 {
            font-size: 100px;
            position: relative;
            display: inline-block;
            z-index: 2;
            height: 250px;
            letter-spacing: 15px;
        }
        ._1 {
            text-align: center;
            display: block;
            position: relative;
            letter-spacing: 12px;
            font-size: 4em;
            line-height: 80%;
        }
        ._2 {
            text-align: center;
            display: block;
            position: relative;
            font-size: 20px;
        }
        .text {
            font-size: 70px;
            text-align: center;
            position: relative;
            display: inline-block;
            margin: 19px 0px 0px 0px;
            z-index: 3;
            width: 100%;
            line-height: 1.2em;
        }
        .btn-main {
            background-color: rgb(255, 255, 255);
            position: relative;
            display: inline-block;
            width: 358px;
            padding: 10px;
            z-index: 5;
            font-size: 25px;
            color: #33cc99;
            text-decoration: none;
            margin-right: 10px;
        }

        .cloud {
            width: 350px;
            height: 120px;
            background: #FFF;
            background: linear-gradient(top, #FFF 100%);
            background: -webkit-linear-gradient(top, #FFF 100%);
            background: -moz-linear-gradient(top, #FFF 100%);
            background: -ms-linear-gradient(top, #FFF 100%);
            background: -o-linear-gradient(top, #FFF 100%);
            border-radius: 100px;
            position: absolute;
            z-index: -1;
            transition: ease 1s;
        }
        .cloud:after, .cloud:before {
            content: '';
            position: absolute;
            background: #FFF;
            z-index: -1;
        }
        .cloud:after {
            width: 100px;
            height: 100px;
            top: -50px;
            left: 50px;
            border-radius: 100px;
        }
        .cloud:before {
            width: 180px;
            height: 180px;
            top: -90px;
            right: 50px;
            border-radius: 200px;
        }
        .x1 {
            top: -50px;
            left: 100px;
            transform: scale(0.3);
            opacity: 0.9;
            animation: moveclouds 15s linear infinite;
        }
        .x1_5 {
            top: -80px;
            left: 250px;
            transform: scale(0.3);
            animation: moveclouds 17s linear infinite;
        }
        .x2 {
            left: 250px;
            top: 30px;
            transform: scale(0.6);
            opacity: 0.6;
            animation: moveclouds 25s linear infinite;
        }
        .x3 {
            left: 250px;
            bottom: -70px;
            transform: scale(0.6);
            opacity: 0.8;
            animation: moveclouds 25s linear infinite;
        }
        .x4 {
            left: 470px;
            bottom: 20px;
            transform: scale(0.75);
            opacity: 0.75;
            animation: moveclouds 18s linear infinite;
        }
        .x5 {
            left: 200px;
            top: 300px;
            transform: scale(0.5);
            opacity: 0.8;
            animation: moveclouds 20s linear infinite;
        }
        @keyframes moveclouds {
            0% { margin-left: 1000px; }
            100% { margin-left: -1000px; }
        }
    </style>
</head>
<body>
    <div id="clouds">
        <div class="cloud x1"></div>
        <div class="cloud x1_5"></div>
        <div class="cloud x2"></div>
        <div class="cloud x3"></div>
        <div class="cloud x4"></div>
        <div class="cloud x5"></div>
    </div>
    <div class='c'>
        <div class='_404'> ERROR PAGE</div>
      
        <div class='_1'>잘못된 접근입니다. </div>
        <br><br><br>
        <div class='_2'></div>
        <a class='btn btn-main' href='${pageContext.request.contextPath}/'>Back to MAIN PAGE</a>
    </div>
</body>
</html>