import React from 'react';
import { Card, Col, Row, Button } from 'antd';
import BookCover from '../images/book_cover.jpg';

export default function CustomCard(props) {

    return (
        <div className="site-card-wrapper" style={{ position: 'relative' , bottom: 50}}>
            {console.log(props.booksData)}
            <Row gutter={16}>
            {
                props.booksData.map((book, index) => {
                    return (
                        <Col key={index}>
                            <Card 
                                title={book.book_details[0].title} 
                                bordered={false}
                                cover={<img alt="example" src={BookCover} />}
                                style={{ width: 300, height: 590}}
                                hoverable
                            >
                                <p><b><i>{book.book_details[0].author}</i></b></p>
                                {book.book_details[0].description}                       
                            </Card>
                            <div style={{position: 'relative', bottom: 50 }}>
                                    <Button type="primary" shape="round">View Details</Button>        
                            </div>
                        </Col>
                    )
                })
            }
            </Row>
        </div>
    )
}