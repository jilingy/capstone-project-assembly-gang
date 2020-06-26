import React from 'react';
import { Card, Col, Row, Button } from 'antd';

export default function CustomCard(props) {

    return (
        <div className="site-card-wrapper" style={{ position: 'relative' , bottom: 25}}>
            <Row gutter={16}>
            {
                props.booksData.map(book => {
                    return (
                        <Col key={book.id}>
                            <Card 
                                title={book.title} 
                                bordered={false}
                                cover={<img alt="example" src={book.img_url} />}
                                style={{ width: 240 }}
                                extra={<Button type="primary" shape="round">View Details</Button>}
                                hoverable
                            >
                                {book.desc}
                            </Card>
                        </Col>
                    )
                })
            }
            </Row>
        </div>
    )
}