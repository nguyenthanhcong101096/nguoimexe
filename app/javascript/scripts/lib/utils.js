export const closest = (el, selector) => {
  const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector

  while (el) {
    if (matchesSelector.call(el, selector)) {
      return el
    } else {
      el = el.parentElement
    }
  }
  return null
}

export const getSiblings = element => {
	// Setup siblings array and get the first sibling
	let siblings = []
	let sibling = element.parentNode.firstChild

	// Loop through each sibling and push to the array
	while (sibling) {
		if (sibling.nodeType === 1 && sibling !== element) {
			siblings.push(sibling)
		}
		sibling = sibling.nextSibling
  }

	return siblings
}

export const removeActiveClass = (strElement, className) => {
  Array.prototype.slice.call(document.querySelectorAll(strElement)).forEach(element => {
    element.classList.remove(className)
  })
}
