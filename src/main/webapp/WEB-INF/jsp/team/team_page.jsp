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
</head>
<body class="flex h-screen overflow-hidden bg-gray-100">

  <div id="documentList" class="w-1/4 overflow-auto p-4">
      <button id="addDocument" class="py-2 px-4 bg-blue-500 text-white rounded shadow">Add Document</button>
      <!-- Document list goes here -->
      <c:forEach var="post" items="${teamPostArray}">
      <button class="document-item py-2 px-4 bg-blue-500 text-white rounded shadow"
              id="team-post-${post.teamPost_id}"
              data-team-post="${post.teamPost_id}"
              data-title="${post.title}"
              data-content="${post.contents}"
              data-proposal-id="${post.proposal_id}">
        ${post.title}
      </button>

      </c:forEach>
  </div>

    <div id="editorContainer" class="w-3/4 flex flex-col">
        <div id="markdownPreview" class="flex-1 overflow-auto p-4 bg-white m-2 rounded shadow"></div>
        <input id="titleInput" type="text" placeholder="Enter document title here..." class="p-2 m-2 border border-gray-300 rounded" style="margin-top: 20px;">
        <textarea id="markdownInput" class="flex-1 p-4 m-2 bg-white border border-gray-300 rounded shadow resize-none" placeholder="Write your markdown content here..."></textarea>
        <button id="saveButton" class="py-2 px-4 bg-blue-500 text-white rounded m-2 self-end">save</button>
        <button id="deleteButton" class="py-2 px-4 bg-blue-500 text-white rounded m-2 self-end">delete</button>
            <button id="togglePreview" class="py-2 px-4 bg-blue-500 text-white rounded m-2 self-end">전체보기</button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/team/team.js"></script>
</body>
</html>