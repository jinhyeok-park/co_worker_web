window.onload = function() {
    // globalPostData 변수 사용
    postData.forEach(function(post) {
        var div = document.createElement('div');
        div.textContent = post.title;
        document.getElementById('postListContainer').appendChild(div);
    });
};
