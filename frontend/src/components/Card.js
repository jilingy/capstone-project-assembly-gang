import React from 'react';
import { Card, Col, Row, Button } from 'antd';

export default class CustomCard extends React.Component {

    constructor(props) {
        super(props);
        this.state = {

        }
    }

    render() {
        return (
            <div className="site-card-wrapper">
                <p>Below is an example of a customisable Antd 'Card' component that has multiple parameters that can be attached to it</p>
                <Row gutter={16}>
                {
                    this.props.booksData.map(book => {
                        return (
                            <Col>
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
}