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
            $('.container').html('')
            institutions.forEach(institution => {
                let newInstitution = new Institution(institution)
                let institutionHtml = newInstitution.formatIndex()
                    $('.container').append(institutionHtml)
            })
        })
    })
}


function showInstitution() {
    $(document).on('click', ".show_institution", function(e) {
      e.preventDefault()
      $('.container').html('')
      let id = $(this).attr('data-id')
      
      fetch(`/institutions/${id}.json`)
      .then(response => response.json())
        .then(institution => {
    
        let newInstitution = new Institution(institution)
        let institutionHtml = newInstitution.formatShow()
        $('.container').append(institutionHtml)
        })
    })
  }

function newForm() {
    $(document).on('submit', '#new_institution', function(e) {
      e.preventDefault()
  
      const values = $(this).serialize()
  
      $.post('/institutions', values).done(function(data) {
        $('.container').html('')
        const newInstitution = new Institution(data)
        const institutionHtmlToAdd = newInstitution.formatShow()
        $('.container').html(institutionHtmlToAdd)
      })
    })
  }
    
function Institution(institution) {

    this.id = institution.id
    this.name = institution.name
    this.address = institution.address
    this.rollovers = institution.rollovers
    
    
}
Institution.prototype.formatIndex = function(){
  
    let institutionHtml = `
    <a href="/institutions/${this.id}" data-id="${this.id}" class="show_institution"><h1>${this.name}</h1></a>
    ` 
    return institutionHtml
}

Institution.prototype.formatShow = function(){

  let rolloversHtml = ``
  this.rollovers.forEach((rollover) => {
    rolloversHtml += `<li> ${rollover.amount} `
  })
    
    let institutionHtml = `
    <h3>${this.name}</h3>
    <h3>${this.address}</h3>
    
    <h3>Rollovers</h3>
      ${rolloversHtml}
    
    `

      

    return institutionHtml
}
