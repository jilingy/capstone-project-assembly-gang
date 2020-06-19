import React from 'react';

class TestContainer extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            
        }
    }

    render() {
        return (
            <div>
                <p>Hello world! This paragraph tag is actually contained within another component!</p>
            </div>
        )
    }
}


export default TestContainer;
