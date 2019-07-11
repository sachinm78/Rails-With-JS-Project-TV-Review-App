$(function(){
    console.log("js is loading!")
    getShows()
})

// function listenForClick(){
//     $("button#shows-db").on('click', function (event){
//         event.preventDefault()
//         getShows()
//     })
// }

function getShows(){
    $.ajax({
        url: 'http://localhost:3000/',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        data.forEach(show => {
            let allShows = new Show(show)
            // console.log(allShows);
            let allShowsHTML = allShows.showsHTML()
            document.getElementById("ajax-index").innerHTML += allShowsHTML
          })
    })
}

class Show {
    constructor (obj){
        this.id = obj.id
        this.title = obj.title
        this.genre = obj.genre
        this.reviews = obj.reviews
    }
}

Show.prototype.showsHTML = function() {
    let reviews = this.reviews.map(review => {
        return(`
            <p>${review.rating} - ${review.comment}</p>
        `)
    })
    
    return(`
        <div>
            <h3>${this.title} - ${this.genre}</h3>
            <p>${reviews}</p>
        </div>
    `)
}

function getReview(){
    $.ajax({
        url: 'http://localhost:3000/',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log(data)            
          })
}