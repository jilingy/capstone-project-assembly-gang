import React from 'react';
import CustomCard from '../components/Card';
import BookCover from '../images/book_cover.jpg';

export default class TestContainer extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            
        }
    }

    render() {

        let booksData = [
            {
              id: 1,
              title: "Book 1",
              desc: "Book 1 Description",
              img_url: BookCover,
            },
            {
              id: 2,
              title: "Book 2",
              desc: "Book 2 Description",
              img_url: BookCover,
            },
            {
              id: 3,
              title: "Book 3",
              desc: "Book 3 Description",
              img_url: BookCover,
            },
        ];


        return (
            <div>
                <p>Hello world! This paragraph tag is actually contained within another component!</p>
                <CustomCard booksData={booksData}/>
            </div>
        )
    }
}
