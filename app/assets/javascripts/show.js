// *** - calls functions when page loads.
$(function(){
    console.log("js is loading!")
    getShows()
    getReviews()
    showReview()
    newShow()
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

// *** - new show form with js
function newShow() {
    $('#new_show_form').on('submit', function(e) {
        e.preventDefault()
        
        let values = $(this).serialize()
        const userId = document.location.href.match(/\d+/g)[1];
        
        $.post(`/users/${userId}/shows`, values).done(function(data) {
            // console.log(data)
            // $('#app-container').html('')
                        
            })
    })
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

// *** - shows review without refresh
// *** - edit button is not responding.
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

    $(document).on('click', 'edit-review', function() {
        let id = $(this.id).attr('data-id')
        window.location.href = `/reviews/${id}/edit`
        
    })
}

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
      <button data-id="${this.id}" class="edit-review">Edit Review</button>
    `
    return reviewHtml
}

