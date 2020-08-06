import React, { useState, useEffect } from 'react';
import { apiBooks, apiCollections, apiContains } from '../services/utilities/API';
import CustomCard from '../components/Card';
import { Tabs} from 'antd';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';

function Recommendations(props) {

    const [ratings, setRatings] = useState([]);
    const [topTen, setTopTen] = useState([]);
    const [random, setRandom] = useState([]);

    const getTopTen = () => {
        apiBooks.getAll()
        .then(res => {
            var sorted = res.data.sort((a, b) => b.readCount - a.readCount);
            var show = sorted.slice(0,10);
            setTopTen(show);
        })
    }

    const getByRating = () => {
        apiBooks.getAll()
        .then(res => {
            var filtered = res.data.filter(book => {
                if(book.average_rating > 3.5){
                    return book;
                }else{
                    return null;
                }
            }) 
            setRatings(filtered);
            console.log(random)   
        })
    }

    const getRandom = () =>{
        apiBooks.getAll()
        .then(res => {
            var len = 0;
            var rando;
            var array = [];
            len = res.data.length - 1;
            rando = Math.floor(Math.random() * (len - 0 + 1)) + 0;
            console.log(res.data[rando]);
            array.push(res.data[rando])
            setRandom(array);
        })
       
    }

    const callback = (key) => {
        console.log(key);
        switch(key){
            case '1':
                getRandom();
                break;
            case '2':
                //function call;
                break;
            case '3':
                getByRating();
                break;
            case '4':
                //function call;
                break;
            case '5':
                //function call;
                break;
            case '6':
                //function call;
                break;
            case '7':
                getTopTen();
        }
    }

    const { TabPane } = Tabs;


    return (
        <div>
            <Tabs onChange={callback} type="card" style={{left: 201, position: 'relative'}} size={"large"}>
                <TabPane tab="Daily Recommendation" key="1">
                    <CustomCard partOf={false} booksData={random} />
                </TabPane>
                <TabPane tab="Genres" key="2">
                Content of Tab Pane 2
                </TabPane>
                <TabPane tab="Average Rating" key="3">
                    <CustomCard partOf={false} booksData={ratings} />
                </TabPane>
                <TabPane tab="Authors" key="4">
                Content of Tab Pane 4
                </TabPane>
                <TabPane tab="Common to Others" key="5">
                Content of Tab Pane 5
                </TabPane>
                <TabPane tab="Past Readings" key="6">
                Content of Tab Pane 6
                </TabPane>
                <TabPane tab="Top 10" key="7">
                <CustomCard partOf={false} booksData={topTen} />
                </TabPane>
            </Tabs>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(Recommendations);