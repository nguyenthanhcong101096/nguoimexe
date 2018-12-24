import axios from 'axios';
import { delegate } from 'rails-ujs'

const commentBody = () => document.querySelector('.js-comment-body')
const commentLatest = document.querySelector('.js-comment-latest')

export const onClickBtnCommentLoadMore = () => {
  delegate(document, '.js-btn-comment-loadmore', 'click', (event) => {
    const btn = document.querySelector('.js-btn-comment-loadmore')

    const minCommentId = btn.getAttribute('data-comment-min-id')
    const postId = btn.getAttribute('data-post-id')

    if (!postId || !minCommentId) return

    axios.get('/comments', { params: { post_id: postId, min_id: minCommentId } })
      .then(response => {
        response.data.comments.forEach(comment => {
          commentBody().insertAdjacentHTML('beforeend', comment)
        })

        btn.setAttribute('data-comment-min-id', response.data.min_id)
        if (response.data.min_id === response.data.max_id) { document.querySelector('.js-btn-comment-loadmore').remove() }

        return response
      }).catch(error => { throw error })
  })
}

export const onClickBtnCommentCreate = () => {
  const commentBox = document.querySelector('.js-comment-box')

  delegate(document, '.js-btn-comment-create', 'click', (event) => {
    const postId = event.target.getAttribute('data-post-id')
    const message = commentBox.value

    if (!postId) return

    axios.post('/comments', { post_id: postId, context: message })
      .then(response => {
        commentLatest.insertAdjacentHTML('beforebegin', response.data.comment)
        commentBox.value = ''
        return response
      })
      .catch(error => {
        if (error.response && error.response.status === 422) {
          console.log(error.response.data.errors.message)
        }
      })
  })
}
