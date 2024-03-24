<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Markdown Editor with Tailwind CSS</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>

          #addDocument {
            border: 1px solid rgb(14, 165, 233); /* 테두리 색상과 너비 설정 */
            color: rgb(14, 165, 233); /* 글자 색상 설정 */
          }

          #addDocument:hover {
            background-color: rgb(13, 148, 209); /* 호버 시 배경색 - 조금 더 진한 sky 색상 */
            color: white; /* 호버 시 글자 색상 */
          }
               .test {
                      border: 1px solid rgb(14, 165, 233); /* 테두리 색상과 너비 설정 */
                      color: rgb(14, 165, 233); /* 글자 색상 설정 */
                    }

                    .test:hover {
                      background-color: rgb(13, 148, 209); /* 호버 시 배경색 - 조금 더 진한 sky 색상 */
                      color: white; /* 호버 시 글자 색상 */
                    }

                     .custom-scrollbar::-webkit-scrollbar {
                          display: none; /* Chrome, Safari and Opera */
                      }
        </style>
</head>
<body class="flex h-screen overflow-hidden">

<div id="documentList" class="w-1/6 p-4 bg-gray-200 overflow-hidden">
    <button id="addDocument" class="py-2 mb-4 px-4  rounded shadow">Add Document</button>
    <hr>
    <!-- Document list goes here -->
    <c:forEach var="post" items="${teamPostArray}">
    <button class="document-item py-2 px-4  text-gray-600 hover:bg-gray-300 rounded  mb-2 w-full h-10 overflow-ellipsis overflow-hidden whitespace-nowrap"
            id="team-post-${post.teamPost_id}"
            data-team-post="${post.teamPost_id}"
            data-title="${post.title}"
            data-content="${post.contents}"
            data-proposal-id="${post.proposal_id}">
      ${post.title}
    </button>
    </c:forEach>
</div>

<div id="editorContainer" class="flex flex-col w-5/6 h-5/6">
    <div class="flex h-screen">
        <div class="flex flex-col w-1/2 p-4">
            <input id="titleInput" type="text" placeholder="Enter document title here..." class="w-full p-2 mb-4 border-b rounded">
            <textarea id="markdownInput" placeholder="Write your markdown content here..." class="custom-scrollbar flex-1 p-4 bg-white border-none rounded resize-none" style="max-height: calc(100vh - 200px); overflow-auto"></textarea>
        </div>
        <div id="markdownPreview" class="custom-scrollbar w-1/2 max-h-2/3 overflow-y-auto p-4 bg-white rounded border-none  mr-10" style="max-height: calc(100vh - 200px); overflow-auto"></div>
    </div>
    <div class="flex justify-end mt-2 p-4">
        <button id="saveButton" class="test py-2 px-4  text-white rounded m-2">Save</button>
        <button id="deleteButton" class="test py-2 px-4  text-white rounded m-2">Delete</button>
        <button id="togglePreview" class="test py-2 px-4  text-white rounded m-2">Toggle Preview</button>
    </div>
</div>



    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/team/team.js"></script>
</body>
</html>