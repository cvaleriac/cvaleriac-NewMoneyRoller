$( document ).ready(function() {
    $("a[href$='institutions']").click(function( event ) {
 
        event.preventDefault();
        fetch(`/institutions.json`)
        .then(res => res.json())
        .then(institutions => {
            $('#app-container').html('')
            institutions.forEach(institution => {
                let newInstitution = new Institution(institution)
                let institutionHtml = newInstitution.formatIndex(
                    $('#app-container').append(institutionHtml)
                )
            })
        })

 
    });
 
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
    <h1>$(this.name)</h1>
    `
    return institutionHtml
}