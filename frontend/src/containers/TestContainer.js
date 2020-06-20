import React from 'react';
import CustomCard from '../components/Card';

class TestContainer extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            
        }
    }

    render() {

        let booksData = [
            {
              title: "Book 1",
              desc: "Book 1 Description"
            },
            {
              title: "Book 2",
              desc: "Book 2 Description"
            },
            {
              title: "Book 3",
              desc: "Book 3 Description"
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


export default TestContainer;
