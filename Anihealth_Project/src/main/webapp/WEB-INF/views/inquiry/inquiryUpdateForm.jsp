<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
   div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }
  /* 메인 영역 시작 */
  .parent {
            width: 100%;
            text-align: center; 
            padding: 40px;
        }

        .parent-content {
            width: 100%;
            margin: 0 auto;
            /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
            text-align: left;
        }


        /* faq 제목 시작 */
        .header-faq {
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
            margin-bottom: 70px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }

        /* faq 제목 끝 */


        .cart-background {
            width: 70%;
            height: auto;
            margin: auto;
            padding: 30px 30px;
            background-color: #fff;
           box-shadow:0 0 8px 2px rgba(4, 4, 4, 0.1);
            border-radius: 10px;
            box-sizing: border-box;
            position: relative;
        }
        .cart-table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 10px;
        }

    
        .header-text {
            color: #696969;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin:  20px 0;
            text-align: center;
        }

        .cart-table th,
        .cart-table td {
            padding: 15px;
            text-align: left;
             border-bottom: 1.5px solid lightgray; 
        }

        .cart-table thead {
            background-color: #e9f7e2;
            color:  #444;
            font-size: 113%;
        }
        .cart-table-content td {
            vertical-align: middle; 
            height: 100%;
           color:  #444;
        }

        .cart-table-inner td{
            font-size: 100%;
        }
        
        .item-container {
            display: flex;
            align-items: center; 
            padding: 0px 10px; 
            flex-direction: row; 
        }

        #quantity-cell {
            padding-left: 0;
        }

        #title-iq{
           padding-left: 20px;
        }
        #checkout-button {
            display: block;
            box-sizing: border-box;
            width: auto;
             margin: 10px auto 20px;
            padding: 10px 30px;
            margin-left: 80%;
            background-color: #99BC85;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

		#checkout-button:hover {
		     background-color:#7b9a6a;
		}

        .content h2{
             color: #57585c;
             text-align: center;
        }
        #btn-update{
            padding: 10px 50px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color:#87cfb8;
            color: white;
            font-size: large;
              margin: 3px;
        }
        #btn-delete{
            padding: 10px 50px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: rgb(103, 162, 130);
            color: white;
            font-size: large;
             margin: 3px;
        }
        #btn-update:hover {
		    background-color:#4fc29d;
		}
        #btn-delete:hover {
		    background-color:rgb(53, 175, 110);
		}
		
		 .label1{
		 	font-size: 120%;
		 }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
        .content {
            width:100%;
            margin:auto;
        }
        .innerOuter {
            width:100%;
            margin:auto;
            padding:5% 10%;
        }
        .content h2{
	         color: #57585c;
	         text-align: center;
        }
        /* 전체 내용 영역 끝 */
        /* 메인 영역 끝 */
</style>


</head>

<body>

<jsp:include page="../common/header.jsp" />

<div class="parent">
   <div class="parent-content">

            <div class="header-faq">
                <h1>1 : 1 문의</h1>
            </div>
            <br>

        

               <div class="cart-background">
                <div class="content">
                      <br> <h2 > 문의글 수정하기</h2><br>
                    <div class="innerOuter">

                        <form id="enrollForm" method="post" action="update.iq">
                        
                           <!-- 해당 게시글의 글번호 (PK) 도 같이 넘기기 -->
                           <input type="hidden" name="inquiryNo" value="${ requestScope.iq.inquiryNo }">
                           
                            <table align="center">
                                <tr>
                                    <th><label for="title" style="color: #57585c;"  class="label1">제목</label></th>
                                    <td><input type="text" id="title" class="form-control"
                                                value="${ requestScope.iq.inquiryTitle }" name="inquiryTitle" required></td>
                                </tr>
                
                                <tr>
                                    <th><label for="content"  style="color: #57585c;"  class="label1">내용</label></th>
                                    <td><textarea id="content" class="form-control" 
                                                  rows="10" 
                                                  style="resize:none;" 
                                                  name="inquiryContent" required>${ requestScope.iq.inquiryContent }</textarea></td>
                                </tr>
                            </table>
                            <br>   <br>
            
                            <div align="center">
                                <button type="submit" class="btn btn-update" id="btn-update">수정하기</button>
                                <button type="reset"  class="btn btn-delete" id="btn-delete" onclick="javascript:history.go(-1);">뒤로가기</button>
                            </div>
                        </form>
                    </div>
                </div>
          </div>
    </div>
</div>
 <br><br><br>
 
    
     
 <style>

    @media (max-width: 950px) {
    .cart-background {
        width: 100%;
        padding: 20px;
    }

    .cart-table-header {
        flex-direction: column;
        align-items: flex-start;
    }

    .left-header, .right-header {
        margin-bottom: 10px;
    }

    .item-container {
        flex-direction: column;
        align-items: flex-start;
    }

    .item-text {
        padding-left: 0;
        margin-top: 10px;
    }

    .quantity-wrapper {
        justify-content: space-between;
        width: 100%;
    }
}
    </style>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>