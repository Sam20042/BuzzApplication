import { useState, useContext } from 'react';
import './CreateIdea.css';



function CreateIdea(props) {
    const [inputType, changeInput] = useState("button");
    return (
        <div className="create-idea">
            {inputType === "button" ? <CreateIdeaButton /> : <WriteIdeaBox state={props.state} />}
        </div>
    );

    function CreateIdeaButton() {
        return (
            <>
                <button
                    className="create-idea-button"
                    type="button"
                    onClick={() => {
                        changeInput("write")
                    }}
                >
                    Create Idea
                </button>
            </>
        );
    }

    function WriteIdeaBox(props) {
        // const { ideas, setIdeas } = useContext(UserContext);
        // let updated_ideas = ideas;
        // updated_ideas.append({ id: 4, title: "test 4", author: "test 4", message: "test 4", likes: 666 })
        // console.log(ideas);
        const [ideas, setIdeas] = props.state;
        return (
            <>
                {/* <input type="text" 
                    className="write-idea-box" 
                    textarea=
                    placeholder="Write your idea here..." 
                /> */}
                <textarea
                    className="write-idea-box"
                    name="new_idea"
                    rows="10"
                    cols="5"
                />
                <button
                    className="submit-idea-button"
                    type="button"
                    onClick={() => {
                        setIdeas([...ideas, { id: 4, title: "test 4", author: "test 4", message: "test 4", likes: 666 }]);
                        console.log("updated");
                        changeInput("button");
                    }}
                >
                    Submit Idea
                </button>
                <button
                    className="cancel-idea-button"
                    type="button"
                    onClick={() => {
                        changeInput("button");
                    }}
                >
                    Cancel Idea
                </button>

            </>
        );
    }
}

export default CreateIdea;