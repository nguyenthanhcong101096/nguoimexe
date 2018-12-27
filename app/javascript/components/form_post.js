import React, { Component } from 'react';

export default class FormPost extends Component {
  constructor(props){
    super(props)
  }
  
  render(){
    return(
      <div className='horizontal' style="padding-left:32px; padding-right:32px;">
        <div className='post-create'>
          <form id="some-form">
              <input className="form-control no-border font-size-14 u-text-bold" placeholder="Nhập tiêu đề"/>
          </form>
        </div>
      </div>
    )
  }
}



// div class='horizontal' style="padding-left:32px; padding-right:32px;"
//         div class='post-create'
//           = form_for(:post, url: posts_path, html: { id: 'some-form' }) do |f|
//             = f.text_field :title, class: 'form-control no-border font-size-14 u-text-bold', placeholder: 'Nhập tiêu đề'
//             div class='editor'
//               div class="quill font-size-14" id="editor-container"
//               input[id='content' name="post[content]" hidden value="cong"]
//               .images.pb-8
//                 h4.u-text-bold HÌNH ẢNH (Tối đa 6 ảnh)
//                 .horizontal.u-mt-8
//                   input[type="file" class="js-writer-avatar" name="pictures" id="pictures" multiple]
//                   label for="pictures"
//                     img[id="pictures-preview" class="img-post" src=asset_pack_path('images/img_default.jpg')]
//                   .list-pictures
//               .category.pb-8
//                 h4.u-text-bold LOẠI XE
//                 .horizontal.u-mt-8
//                   pre.mr-8 #Oto
//                   pre.mr-8 #Moto
//                   pre.mr-8 #Bike
//                   pre.mr-8 #Other
//               .certificate.pb-8
//                 h4.u-text-bold GIẤY TỜ
//                 .horizontal.u-mt-8
//                   blockquote Vehicle Registration Certificate
//               .price.pb-8
//                 h4.u-text-bold GIÁ BÁN
//                 .horizontal.u-mt-8
//                   blockquote 125.000.000VNĐ
//               input type="submit" value="Chấp nhận" class='form-control u-text-bold u-mt-16'
