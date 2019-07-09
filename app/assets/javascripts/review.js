$(function(){
    console.log("js is loading!")
    listenForClick()
})

function listenForClick(){
    $("button#reviews-db").on('click', function (event){
        event.preventDefault()
        console.log('I clicked the button')
        // getReviews()
    })
}

function getReviews(){
    // debugger
    $.ajax({
        url: 'http://localhost:3000/reviews',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("the data is", data)
        // let firstReview = new Review(data[0])
        // let myReviewHTML = firstReview.reviewHTML()
        // document.getElementById("ajax-reviews-index").innerHTML += myReviewHTML
    })
}

class Review {
    cunstructor (obj){
        this.id = obj.id
        this.user_id = obj.user_id
        this.show_id = obj.show_id
        this.rating = obj.rating
        this.comment = obj.comment
    }
}

Review.prototype.reviewHTML = function() {
    return(`
        <div>
            <h3>${this.rating}</h3>
            <p>${this.comment}</p>
        </div>
    `)
}