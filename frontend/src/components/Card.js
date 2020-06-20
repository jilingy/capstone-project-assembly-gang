import React from 'react';
import { Card, Col, Row } from 'antd';

class CustomCard extends React.Component {

    constructor(props) {
        super(props);
        this.state = {

        }
    }

    render() {
        return (
            <div className="site-card-wrapper">
                <Row gutter={16}>
                {
                    this.props.booksData.map(book => {
                        return (
                            <Col span={8}>
                                <Card title={book.title} bordered={false}>
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

export default CustomCard;