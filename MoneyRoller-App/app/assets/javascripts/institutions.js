$(() => {
    bindClickHandlers()
})

const bindClickHandlers = () => {
    $('.all_institutions').on('click', (e) => {
    e.preventDefault()
    console.log('hello')
       
    })
}