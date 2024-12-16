<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    
    <link rel="stylesheet" href="/resources/css/common.css" />
    
    <title>클래스잇 클래스추천</title>

    <style>
        body {
            background-color: #f0f0f0;
        }
        .page_wrapper {
        	position: relative;
    		font-family: Arial, sans-serif;
            
            color: #333;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
		}
		.select_title>a {
			font-family: 'Paperlogy-8ExtraBold';
			color: #3d7373;
		}
		.container {
			background-color: white;
    		border: 1px solid black; /* 스타일 추가 */
    		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    		padding: 20px;
    		width: 800px;
    		text-align: center;
    		margin-top: 20px;
		}
        .step {
            margin: 20px 0;
        }
        h2 {
            margin-bottom: 20px;
        }
        button {
            background-color: #3d7373;
            border: 2px solid #3d7373;
            color: white;
            padding: 15px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin: 10px 0;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2b5454;
        }
        .back-button {
            font-size: 14px;
            padding: 10px;
            background: none;
            border: 2px solid #3d7373;
            color: #3d7373;
            font-weight: bold;
        }
        
        .back-button:hover {
        	color: #fff;
        }
        
        .hidden {
            display: none;
        }
        
        .cover {
        	position: absolute;
        	top: 50%;
        	left: 50%;
        	transform: translate(-50%, -50%);
        	text-align: center;
        	width: 992px;
        	height: 294px;
        	border: 1px solid black;
        	background: #fff;
        	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    		padding: 20px;
    		margin-top: 34px;
    		display: flex;
    		flex-direction: column;
    		justify-content: center;
        }
        
        .cover_btn_box {
        	display: flex;
        	justify-content: center;
        	gap: 20px;
        }
        
        .cover_btn_box>button {
        	width: 30%;
        }
        
        .cover_btn_box>button>a {
        	color: #fff;
        }
    </style>
    <script>
        let selections = [];

        function showNextStep(currentStep, selectedValue) {
            // 선택한 값을 저장
            selections[currentStep - 1] = selectedValue;

            // 현재 단계 숨기기
            document.getElementById('step' + currentStep).classList.add('hidden');

            // 다음 단계 보여주기
            const nextStep = currentStep + 1;
            const nextStepDiv = document.getElementById('step' + nextStep);
            if (nextStepDiv) {
                nextStepDiv.classList.remove('hidden');
            } else {
                // 마지막 단계에서 결과 페이지로 이동
                document.getElementById('resultForm').submit();
            }
        }

        function showPreviousStep(currentStep) {
            // 현재 단계 숨기기
            document.getElementById('step' + currentStep).classList.add('hidden');

            // 이전 단계 보여주기
            const previousStep = currentStep - 1;
            const previousStepDiv = document.getElementById('step' + previousStep);
            if (previousStepDiv) {
                previousStepDiv.classList.remove('hidden');
            }
        }

        function setSelection(step, value) {
            document.getElementById('selection' + step).value = value;
        }
    </script>
</head>
<body>

	
    <div class="page_wrapper">
    	<h1 class="select_title"><a href='/'>CLASS IT</a></h1>
    	
    	<div class="cover">
            	<h2>몇 가지 질문을 통해 고객님에게 어울리는 클래스를 소개해드립니다.</h2>
            	<h2>시작하시겠습니까?</h2>
            	<div class="cover_btn_box">
            		<button class="yes">네, 선택을 시작할게요.</button>
            		<button><a href='/'>아니요, 메인페이지로 이동할래요.</a></button>
            	</div>
        </div>
        
    	<div class="container">

        <form id="resultForm" action="/selectresult" method="post">
            <input type="hidden" id="selection1" name="selection1" value="">
            <input type="hidden" id="selection2" name="selection2" value="">
            <input type="hidden" id="selection3" name="selection3" value="">
            <input type="hidden" id="selection4" name="selection4" value="">

            <div id="step1" class="step">
                <h2>"사람들과의 대화 후, 에너지가 더 생기는 편인가요?"</h2>
                <button type="button" onclick="setSelection(1, 'E'); showNextStep(1, '1-1');">네, 사람들과 이야기하는 것이 즐겁고 에너지를 줍니다.</button>
                <button type="button" onclick="setSelection(1, 'I'); showNextStep(1, '1-2');">아니요, 혼자 있는 시간이 더 편하고 에너지를 회복합니다.</button>
            </div>

            <div id="step2" class="step hidden">
                <h2>"새로운 경험을 할 때, 과거의 경험을 바탕으로 판단하는 편인가요?"</h2>
                <button type="button" onclick="setSelection(2, 'S'); showNextStep(2, '2-1');">네, 과거의 경험이 중요합니다.</button>
                <button type="button" onclick="setSelection(2, 'N'); showNextStep(2, '2-2');">아니요, 새로운 가능성을 탐색하는 것이 더 중요합니다.</button><br><br>
                <button type="button" class="back-button" onclick="showPreviousStep(2);">다시 선택하기</button>
            </div>

            <div id="step3" class="step hidden">
                <h2>"결정을 내릴 때, 논리와 객관적인 사실을 더 중시하나요?"</h2>
                <button type="button" onclick="setSelection(3, 'T'); showNextStep(3, '3-1');">네, 논리적인 접근이 중요합니다.</button>
                <button type="button" onclick="setSelection(3, 'F'); showNextStep(3, '3-2');">아니요, 사람들의 감정과 관계가 더 중요합니다.</button><br>
                <button type="button" class="back-button" onclick="showPreviousStep(3);">다시 선택하기</button>
            </div>
	
            <div id="step4" class="step hidden">
                <h2>"마감일이 다가올 때, 미리 준비하는 편인가요?"</h2>
                <button type="button" onclick="setSelection(4, 'J'); showNextStep(4, '4-1');">네, 미리 준비하는 것이 편합니다.</button>
                <button type="button" onclick="setSelection(4, 'P'); showNextStep(4, '4-2');">아니요, 마지막 순간에 하는 것이 더 흥미롭습니다.</button><br>
                <button type="button" class="back-button" onclick="showPreviousStep(4);">다시 선택하기</button>
            </div>

            <div id="step5" class="step hidden">
                <h2>"추천 결과 페이지로 이동하기"</h2>
                <button type="button" onclick="document.getElementById('resultForm').submit();">추천 결과 확인하기</button>
                <button type="button" class="back-button" onclick="showPreviousStep(5);">다시 선택하기</button>
            </div>
        </form>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>


    <script>
    
    $(".yes").on("click", function(e){
		e.preventDefault();
		$(".cover").hide();
	})
        // showNextStep 함수 수정
        function showNextStep(currentStep, selectedValue) {
            // 선택한 값을 저장
            selections[currentStep - 1] = selectedValue;

            // 현재 단계 숨기기
            document.getElementById('step' + currentStep).classList.add('hidden');

            // 다음 단계 보여주기
            const nextStep = currentStep + 1;
            if (nextStep <= 4) {
                const nextStepDiv = document.getElementById('step' + nextStep);
                nextStepDiv.classList.remove('hidden');
            } else {
                // 마지막 단계에서 추천 결과 확인하기 단계로 이동
                document.getElementById('step5').classList.remove('hidden');
            }
        }
    </script>
</body>
</html>
