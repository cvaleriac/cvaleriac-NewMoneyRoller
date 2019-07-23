$( document ).ready(function() {
    institutionsIndexClick() 
    showInstitution()
    newForm()

})

   function institutionsIndexClick(){

     $("a[href$='institutions']").click(function( event ) {
 
        event.preventDefault();
        history.pushState(null, null, "institutions")
        fetch(`/institutions.json`)
        .then(res => res.json())
        .then(institutions => {
            $('.jumbotron.text-center').html('')
            institutions.forEach(institution => {
                let newInstitution = new Institution(institution)
                let institutionHtml = newInstitution.formatIndex()
                    $('.jumbotron.text-center').append(institutionHtml)
            })
        })
    })
}


   function showInstitution(){
        $(document).on('click', ".show_link", function(e) {
        e.preventDefault()
        $('.jumbotron.text-center').html('')
        let id = $(this).attr('data-id')
        fetch('/institution/${id}.json')
        .then(res => res.json())
        .then(institution => {
            let newinstitution = new Institution(institution)
            let institutionHtml = newInstitution.formatShow()
            $('.jumbotron.text-center').append(institutionHtml)
        })
    })
 
}

function newForm() {
    $(document).on('submit', '#new_institution', function(e) {
      e.preventDefault()
      console.log('event preventend')
  
      const values = $(this).serialize()
  
      $.post('/institutions', values).done(function(data) {
        $('.jumbotron.text-center').html('')
        const newInstitution = new Institution(data)
        const institutionHtmlToAdd = newInstitution.formatShow()
        $('.jumbotron.text-center').html(institutionHtmlToAdd)
      })
    })
  }
    
function Institution(institution) {
    this.id = institution.id
    this.name = institution.name
    this.address = institution.address
    this.rollovers = institution.rollovers
    this.users = institution.users
}

Institution.prototype.formatIndex = function(){
    let institutionHtml = `
    <a href="/institutions/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
    ` 
    return institutionHtml
}

Institution.prototype.formatShow = function(){
    let institutionHtml = `
    <h3>${this.name}</h3>
    <h3>${this.address}</h3>
    <h3>${this.rollovers}</h3>
    <h3>${this.users}</h3>
    ` 
    return institutionHtml
}
