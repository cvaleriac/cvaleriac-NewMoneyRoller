$( document ).ready(function() {
    $("a[href$='institutions']").click(function( event ) {
 
        event.preventDefault();
        history.pushState(null, null, "institutions")
        fetch(`/institutions.json`)
        .then(res => res.json())
        .then(institutions => {
            $('#app-container').html('')
            institutions.forEach(institution => {
                let newInstitution = new Institution(institution)
                let institutionHtml = newInstitution.formatIndex()
                    $('#app-container').append(institutionHtml)
            })
        })

 
    });

    $(document).on('click', ".show_link", function(e) {
        e.preventDefault()
        $('#app-container').html('')
        let id = $(this).attr('data-id')
        fetch('/institution/${id}.json')
        .then(res => res.json())
        .then(institution => {
            let newinstitution = new Institution(institution)
            let institutionHtml = newInstitution.formatShow()
            $('#app-container').append(institutionHtml)
        })
    })
 
});
    
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
    ` 
    return institutionHtml
}
