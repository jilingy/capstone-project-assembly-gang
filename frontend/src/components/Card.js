import React from 'react';
import { Card, Col, Row, Button } from 'antd';
import BookCover from '../images/book_cover.jpg';
import axios from 'axios';

export default function CustomCard(props) {

    return (
        <div className="site-card-wrapper" style={{ position: 'relative' , bottom: 50}}>
            <Row gutter={16}>
            {
                props.booksData.map((book, index) => {
                    return (
                        <Col key={index}>
                            <Card 
                                title={book.book_title} 
                                bordered={true}
                                cover={<img alt="example" src={BookCover} />}
                                style={{ width: 300, height: 680, background: '#cfcdc6'}}
                                hoverable
                            >
                                <p><b>{book.book_publisher}</b></p>
                                <p><b>{book.publication_date}</b></p>
                                {book.book_synopsis}                       
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