export const configEditor = () => {
  var toolbarOptions = [
    [{ 'align': [] }],
    [{ 'header': [1, 2, 3] }],
    ['bold', 'italic', 'underline'],
    // ['image', 'video'],
    ['link']
  ];

  var form = document.querySelector('#some-form');
  
  if(!form) return
  var quill = new Quill('#editor-container', {
    placeholder: '    Viết nội dung vào đây',
    theme: 'bubble',
    modules: {
      toolbar: toolbarOptions
    }
  });

  form.onsubmit = function () {
    var postContentInput = document.querySelector('#post_describe');
    postContentInput.value = quill.root.innerHTML;
  };
}
