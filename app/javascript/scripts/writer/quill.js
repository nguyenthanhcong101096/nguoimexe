export const configEditor = () => {
  var toolbarOptions = [
    [{ 'color': [] }, { 'background': [] }],
    [{ 'font': [] }],
    [{ 'align': [] }],
    ['clean'],
    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
    [{ 'list': 'ordered' }, { 'list': 'bullet'}],
    ['bold', 'italic', 'underline', 'strike', 'code'],
    ['image'],
    ['link', 'blockquote']
  ];

  var form = document.querySelector('#some-form');
  var review = document.querySelector('.post-review');
  
  if(!form) return
  var quill = new Quill('#editor-container', {
    placeholder: 'Viết nội dung vào đây',
    theme: 'bubble',
    modules: {
      toolbar: toolbarOptions
    }
  });
  
  form.addEventListener('keyup', (e)=>{
    review.innerHTML = quill.root.innerHTML
    console.log('d')
  })
  
  form.onsubmit = function () {
    var postContentInput = document.querySelector('#content');
    postContentInput.value = quill.root.innerHTML;
  };
}
