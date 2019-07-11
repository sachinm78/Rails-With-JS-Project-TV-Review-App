// *** - calls functions when page loads.
$(function(){
    console.log("js is loading!")
    getShows()
    listenForClick()
})

// *** - tests button functionality.
function listenForClick(){
    $("button#js-index").on('click', function (event){
        event.preventDefault()
        console.log("i clicked the button")
    })
}

// *** - gets shows index data and appends it to home page.
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

// *** - Show class constructor.
class Show {
    constructor (obj){
        this.id = obj.id
        this.title = obj.title
        this.genre = obj.genre
        this.reviews = obj.reviews
    }
}

// *** - Show class prototype.
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

// *** - gets the next review.
// function getNextReview(){
//     $.ajax({
//         url: `http://localhost:3000/reviews/${this.id}`,
//         method: 'get',
//         dataType: 'json'
//     }).done(function (data) {
//         $("button#js-next").on('click', function () {
//             let next_review = data.reviewHTML()
//             return next_review        
//         })
//     })      
// }

// *** - Review class constructor.
class Review {
    constructor (obj){
        this.id = obj.id
        this.title = obj.show.title
        this.genre = obj.show.genre
        this.rating = obj.rating
        this.comment = obj.comment
    }
}

// *** - Review class prototype.
Review.prototype.reviewHTML = function() {
    return(`
        <div>
            // <h3>${this.show.title}</h3>
            <p>${review.rating} - ${review.comment}</p>
        </div>
    `)
}

// Post.prototype.formatIndex = function(){
//     let postHtml = `
//       <a href="/posts/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.title}</h1></a>
//     `
//     return postHtml
//   }
  
//   Post.prototype.formatShow = function(){
//     let postHtml = `
//       <h3>${this.title}</h3>
//       <button class="next-post">Next</button>
//     `
//     return postHtml
//   }