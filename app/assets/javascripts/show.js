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
        // debugger
        // console.log("the data is", data)
        let showsDb = data.forEach(function(item) {
            this.title = item.title;
            this.genre = item.genre;
            console.log(showsDb);
          })
         
        })
        // let showsHTML = showsDb.showHTML()
        // document.getElementById("ajax-index").innerHTML += showsHTML
    // })
}

class Show {
    constructor (obj){
        this.id = obj.id
        this.title = obj.title
        this.genre = obj.genre
        this.reviews = obj.reviews
    }
}

Show.prototype.showHTML = function() {
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