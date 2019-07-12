// *** - calls functions when page loads.
$(function(){
    console.log("js is loading!")
    getShows()
    getReviews()
    showReview()
})

// *** - tests button functionality.
// function listenForClick(){
//     $("button#js-index").on('click', function (event){
//         event.preventDefault()
//         console.log("i clicked the button")
//         getReviews()
//     })
// }

// *** - gets shows index data and appends it to home page.
function getShows(){
    $.ajax({
        url: 'http://localhost:3000/',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        data.forEach(show => {
            let allShows = new Show(show)
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

// *** - gets reviews index.
function getReviews(){
    $.ajax({
        url: 'http://localhost:3000/reviews',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        data.forEach(review => {
            let allReviews = new Review(review)
            let allReviewsHTML = allReviews.formatReviewsIndex()
            document.getElementById('js-reviews-index').innerHTML += allReviewsHTML
          })
    })

}

function showReview(){
    $(document).on('click', ".show_link", function(e){
        e.preventDefault()
        $('#app-container').html('')
        let id = $(this).attr('data-id')
        fetch(`/reviews/${id}.json`)
        .then(res => res.json())
        .then(review => {
            let newReview = new Review(review)
            let showReviewHTML = newReview.formatReviewShow()
            $("#app-container").append(showReviewHTML)
        })
    })
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

// *** - Reviews index prototype.
Review.prototype.formatReviewsIndex = function(){
    let reviewsHtml = `
      <a href="/reviews/${this.id}" data-id="${this.id}" class="show_link">
      <h3>${this.title}</h3></a>
    `
    return reviewsHtml
  }
  
// *** - Review show prototype.
Review.prototype.formatReviewShow = function(){
    let reviewHtml = `
      <h3>${this.title}: ${this.genre}</h3>
      <p>${this.rating} - ${this.comment}</p>
    `
    return reviewHtml
}