$(function(){
    console.log("js is loading!")
    listenForClick()
})

function listenForClick(){
    $("button#shows-db").on('click', function (event){
        event.preventDefault()
        getShows()
    })
}

function getShows(){
    // debugger
    $.ajax({
        url: 'http://localhost:3000/',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("the data is", data)
        let firstShow = new Show(data[0])
        let myShowHTML = firstShow.showHTML()
        document.getElementById("ajax-index").innerHTML += myShowHTML
    })
}

class Show {
    cunstructor (obj){
        this.id = obj.id
        this.title = obj.title
        this.genre = obj.genre
        this.reviews = obj.reviews
    }
}

Show.prototype.showHTML = function() {
    return(`
        <div>
            <h3>${this.title}</h3>
            <p>${this.genre}</p>
        </div>
    `)
}