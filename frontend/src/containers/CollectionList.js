import React from 'react';
import { List, Avatar } from 'antd';
import { Link } from 'react-router-dom';
import CollectionListBookCover from '../images/books.svg';

export default function CollectionList() {

    const data = [
        {
            title: 'Main Collection',
            description: 'Default list provided by the platform to all users',
        },
        {
            title: 'Finished Collection',
            description: "List of books marked 'Read' by user",
        }
      ];

    return (
        <div>
            <h1 style={{
                position: 'relative',
                right: 655,
                bottom: 25,
            }}>My Book Collections</h1>
            <List
                itemLayout="horizontal"
                dataSource={data}
                size="small"
                layout="vertical"
                renderItem={item => (
                    <List.Item>
                        <List.Item.Meta
                            avatar={<Avatar src={CollectionListBookCover} />}
                            title={<Link to="/books">{item.title}</Link>}
                            description={item.description}
                        />
                    </List.Item>
                )}
            />
        </div>
    )

}